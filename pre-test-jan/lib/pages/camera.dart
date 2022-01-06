import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? imageFile;
  File? videoFile;

  _camera() async {
    final ImagePicker _picker = ImagePicker();

    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(
        () {
          imageFile = photo as File;
        },
      );
    }
  }

  _picture() async {
    final ImagePicker _picker = ImagePicker();
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    //var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(
        () {
          imageFile = photo as File;
        },
      );
    }
  }

  _videoPic() async {
    final ImagePicker _picker = ImagePicker();
    XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        videoFile = video as File;
      });
    }
  }

  _record() async {
    final ImagePicker _picker = ImagePicker();
    XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      setState(() {
        videoFile = video as File;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Image'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              //mainAxisSize: MainAxisSize.,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  color: Colors.brown,
                  height: MediaQuery.of(context).size.height * (30 / 100),
                  width: MediaQuery.of(context).size.height * (100 / 100),
                  child: videoFile == null
                      ? const Center(
                          child: Icon(
                            Icons.videocam,
                            color: Colors.red,
                            size: 50,
                          ),
                        )
                      : FittedBox(
                          fit: BoxFit.contain,
                          child: mounted
                              ? Chewie(
                                  controller: ChewieController(
                                    videoPlayerController:
                                        //VideoPlayerController.file(_camera()),
                                        VideoPlayerController.file(videoFile!),
                                    aspectRatio: 3 / 2,
                                    autoPlay: true,
                                    looping: true,
                                  ),
                                )
                              : Container(),
                        ),
                ),
                Container(
                  color: Colors.green,
                  height: MediaQuery.of(context).size.height * (30 / 100),
                  width: MediaQuery.of(context).size.height * (100 / 100),
                  child: imageFile == null
                      ? const Center(
                          child: Icon(
                            Icons.photo,
                            color: Colors.blue,
                            size: 50,
                          ),
                        )
                      : Image.file(imageFile!),
                ),
                ElevatedButton(
                  onPressed: _camera,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Click Image'),
                      Icon(
                        Icons.add_a_photo,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _picture,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Gallery'),
                      Icon(Icons.photo_album),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _record,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Record Video'),
                      Icon(Icons.video_camera_back),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _videoPic,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Play Videos'),
                      Icon(Icons.movie_filter),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
