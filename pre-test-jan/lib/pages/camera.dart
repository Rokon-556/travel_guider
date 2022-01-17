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
  // _initialVideoView() {
  //   if (videoFile == null) {
  //     return const Text(
  //       'No Video Selected...',
  //       style: TextStyle(fontSize: 20.0),
  //     );
  //   } else {
  //     return Card(child: Image.file(videoFile!, width: 400.0, height: 400));
  //   }
  // }

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
  _record(BuildContext context)async{
    var video=await ImagePicker().pickVideo(source: ImageSource.camera);
    setState(() {
      videoFile=File(video!.path);
      imgDirPath=video.path;
      print('path');
      print(imgDirPath);
    });
}
_openRecord(BuildContext context)async{
    var videoR=await ImagePicker().pickVideo(source: ImageSource.gallery);
    videoFile=File(videoR!.path);
    imgDirPath=videoR.path;
    print('vPath');
    print(imgDirPath);
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

                  // imageFile == null
                  //     ? const Center(
                  //         child: Icon(
                  //           Icons.photo,
                  //           color: Colors.blue,
                  //           size: 50,
                  //         ),
                  //       )
                  //     : Image.file(imageFile!),
                ),
                ElevatedButton(
                 // onPressed: _camera,
                 // onPressed: _getFromCamera,
                  onPressed: (){
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
                  //onPressed: _picture,
                  //onPressed: _getFromGallery,
                  onPressed: (){
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
                  onPressed: (){
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
                  onPressed: (){
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


// class Camera extends StatefulWidget {
//   @override
//   _CameraState createState() => _CameraState();
// }
//
// class _CameraState extends State<Camera> {
//   String dirPath = '';
//   File? imageFile;
//
//   _initialImageView() {
//     if (imageFile == null) {
//       return Text(
//         'No Image Selected...',
//         style: TextStyle(fontSize: 20.0),
//       );
//     } else {
//       return Card(child: Image.file(imageFile!, width: 400.0, height: 400));
//     }
//   }
//
//   _openGallery(BuildContext context) async {
//     var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
//     setState(() {
//       imageFile = File(picture!.path);
//       dirPath = picture.path;
//       print('path');
//       print(dirPath);
//     });
//   }
//
//   _openCamera(BuildContext context) async {
//     var picture = await ImagePicker().pickImage(source: ImageSource.camera);
//     setState(() {
//       // imageFile = picture as File;
//       imageFile = File(picture!.path);
//       dirPath = picture.path;
//       print('path');
//       print(dirPath);
//     });
//   }
//
//   Future<void> _showChoiceDialog(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Take Image From...'),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: [
//                   GestureDetector(
//                     child: Text('Gallery'),
//                     onTap: () {
//                       _openGallery(context);
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   Padding(padding: EdgeInsets.all(8.0)),
//                   GestureDetector(
//                     child: Text('Camera'),
//                     onTap: () {
//                       _openCamera(context);
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('View Image'),
//         actions: [
//           FlatButton(
//             onPressed: () {
//               logoutChoiceDialog(context);
//             },
//             child: Icon(
//               Icons.logout,
//               color: Colors.white,
//             ),
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _initialImageView(),
//             Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 30.0),
//                   width: 250.0,
//                   child: FlatButton(
//                     child: const Text(
//                       'Select Image',
//                       style: TextStyle(color: Colors.white, fontSize: 16.0),
//                     ),
//                     onPressed: () {
//                       _showChoiceDialog(context);
//                     },
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.0,
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 30.0),
//                   width: 250.0,
//                   child: FlatButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Slideshow()),
//                       );
//                     },
//                     child: Text(
//                       'Slideshow',
//                       style: TextStyle(color: Colors.white, fontSize: 16.0),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.0,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 30.0),
//                   width: 250.0,
//                   child: FlatButton(
//                     child: const Text(
//                       'Image Editor',
//                       style: TextStyle(color: Colors.white, fontSize: 16.0),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MyImagePainter(
//                             filePath: dirPath,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }