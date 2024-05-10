import 'package:flutter/material.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:image_picker/image_picker.dart';

class RefereeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Column(
      //   children: [
      //     const Expanded(
      //       child: Center(
      //         child: Text(
      //           "사진 저장하기",
      //           style: TextStyle(fontSize: 50.0),
      //         ),
      //       ),
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         IconButton(
      //           onPressed: () {
      //             _takePhoto();
      //           },
      //           icon: const Icon(Icons.camera_alt_outlined),
      //           iconSize: 50.0,
      //         ),
      //       ],
      //     ),
      //   ],
      appBar: AppBar(
        title: Text('앱바 영역'),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            '무인 심판 화면',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              //추후 textTheme().displayMedium, 처리해야함
            ),
          ),
        ),
      ),
    );
  }
}

// void _takePhoto() async {
//   ImagePicker().pickImage(source: ImageSource.camera).then((value) {
//     // 카메라를 호출하고 사진을 찍습니다.
//     if (value != null && value.path != null) {
//       print("저장경로 : ${value.path}");

//       GallerySaver.saveImage(value.path).then((value) {
//         // 사진을 갤러리에 저장합니다.
//         print("사진이 저장되었습니다");
//       });
//     }
//   });
// }
