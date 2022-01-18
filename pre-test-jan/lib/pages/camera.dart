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
  String imgDirPath = '';
  String videoDirPath='';
  File? imageFile;
  File? videoFile;

  _initialImageView() {
    if (imageFile == null) {
      return const Text(
        'No Image Selected...',
        style: TextStyle(fontSize: 20.0),
      );
    } else {
      return Card(child: Image.file(imageFile!, width: 400.0, height: 400));
    }
  }

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(picture!.path);
      imgDirPath = picture.path;
      print('path');
      print(imgDirPath);
    });
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      // imageFile = picture as File;
      imageFile = File(picture!.path);
      imgDirPath = picture.path;
      print('path');
      print(imgDirPath);
    });
  }

  _record(BuildContext context) async {
    var video = await ImagePicker().pickVideo(source: ImageSource.camera);
    setState(() {
      videoFile = File(video!.path);
      videoDirPath = video.path;
      print('path');
      print(videoDirPath);
    });
  }

  _openRecord(BuildContext context) async {
    var videoR = await ImagePicker().pickVideo(source: ImageSource.gallery);
    videoFile = File(videoR!.path);
    videoDirPath = videoR.path;
    print('vPath');
    print(videoDirPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multimedia'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              //mainAxisSize: MainAxisSize.,
              children: <Widget>[
                const SizedBox(
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
                  child: _initialImageView(),

                ),
                ElevatedButton(
                  onPressed: () {
                    _openCamera(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Click Image'),
                      Icon(
                        Icons.add_a_photo,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(

                  onPressed: () {
                    _openGallery(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Gallery'),
                      Icon(Icons.photo_album),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _record(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Record Video'),
                      Icon(Icons.video_camera_back),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _openRecord(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
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
