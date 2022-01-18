import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'dart:math';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;


const appId='10bd6bb425eb4b91b2739521b15d6306';
const token='00610bd6bb425eb4b91b2739521b15d6306IAAR95FwdrHM8WaDlkDYe3hZQfGnUZ1VlTPGZEwDL6aL9bvidbEAAAAAEAB/8F67YoHWYQEAAQBigdZh';

class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  int? _remoteUid;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);
    //"eea35a29e63640c58179685ee868a8d5"
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(null, "first_channel", null, 0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helping Video Call'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
            //child: Transform.rotate(angle: 90*pi/180,child: RtcLocalView.SurfaceView(),),

          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child:
                //Container(),
                _renderLocalPreview(),
                //RtcLocalView.SurfaceView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _renderLocalPreview(){
    return Transform.rotate(angle: 90*pi/180,child: RtcLocalView.SurfaceView(),);
  }
  // Display remote user's video
  Widget _remoteVideo() {
    //Transform.rotate(angle: 90*pi/180,child: RtcLocalView.SurfaceView());
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid!);
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
