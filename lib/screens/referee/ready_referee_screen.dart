// import 'dart:async';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:tennis_jamiss/main.dart';
// import 'package:tennis_jamiss/screens/referee/referee_screen.dart';

// class ReadyToRefereeScreen extends StatefulWidget {
//   final CameraDescription camera;

//   const ReadyToRefereeScreen({Key? key, required this.camera})
//       : super(key: key);

//   @override
//   ReadyToRefereeScreenState createState() => ReadyToRefereeScreenState();
// }

// class ReadyToRefereeScreenState extends State<ReadyToRefereeScreen> {
//   late CameraController _controller;

//   //타이머 작동
//   int _counter = 30;
//   Timer? _timer;
//   String currentState = 'count';

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_counter > 0) {
//           _counter--;
//         } else {
//           currentState = 'fail';
//           _stopTimer();
//         }
//       });
//     });
//   }

//   void _stopTimer() {
//     if (_timer != null) {
//       _timer!.cancel();
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     _startTimer();
//     _initializeCamera();
//   }

//   @override
//   void dispose() {
//     // 화면을 세로 방향으로 복구
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     _stopTimer();
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _initializeCamera() async {
//     _controller = CameraController(widget.camera, ResolutionPreset.high,
//         enableAudio: false);
//     await _controller.initialize();
//     setState(() {});
//   }

//   // 1. 카운트 화면
//   Widget countWidget() {
//     return Container(
//         padding: EdgeInsets.all(15),
//         color: Colors.black.withOpacity(0.5),
//         child: Column(
//           children: [
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Text(
//                 '0:0',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 26,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Icon(
//                 Icons.menu,
//                 color: Colors.white,
//                 size: 40,
//               ),
//             ]),
//             SizedBox(
//               height: 30,
//             ),
//             Text(
//               '$_counter',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 72,
//                 fontFamily: 'Pretendard',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               '무인심판 AI 모델이 코트를 인식하고있어요 ... \n스마트폰을 고정해주세요',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontFamily: 'Pretendard',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 15),
//             ElevatedButton(
//               child: Text(
//                 '중단하기',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF464EFF),
//                   fontSize: 20,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: -0.20,
//                 ),
//               ),
//               onPressed: () {
//                 setState(() {
//                   currentState = 'fail';
//                   _stopTimer();
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   minimumSize: Size(200, 50),
//                   shape: RoundedRectangleBorder(
//                       side: BorderSide(width: 1, color: Colors.white),
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//           ],
//         ));
//   }

//   // 2. 카운트 만료 및 코트 인식 실패
//   Widget courtDetectionFailWidget() {
//     _stopTimer();
//     return Container(
//         padding: EdgeInsets.all(15),
//         color: Colors.black.withOpacity(0.5),
//         child: Column(
//           children: [
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Text(
//                 '0:0',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 26,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.w600,
//                   height: 0,
//                   letterSpacing: -0.26,
//                 ),
//               ),
//               Icon(
//                 Icons.menu,
//                 color: Colors.white,
//                 size: 40,
//               ),
//             ]),
//             SizedBox(
//               height: 30,
//             ),
//             Text(
//               'AI모델의 테니스 코트\n인식이 실패했어요.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 26,
//                 fontFamily: 'Pretendard',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(
//               height: 35,
//             ),
//             Text(
//               '아래 다시하기 버튼을 눌러\n테니스 코트 인식을 진행해주세요',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontFamily: 'Pretendard',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 35),
//             ElevatedButton(
//               child: Text(
//                 '다시하기',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF464EFF),
//                   fontSize: 20,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: -0.20,
//                 ),
//               ),
//               onPressed: () {
//                 setState(() {
//                   currentState = 'count';
//                   _counter = 30;
//                   _startTimer();
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   minimumSize: Size(200, 50),
//                   shape: RoundedRectangleBorder(
//                       side: BorderSide(width: 1, color: Colors.white),
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//           ],
//         ));
//   }

//   // 3. 카운트 내 코트 인식 성공
//   Widget courtDetectionSuccessWidget() {
//     _stopTimer();
//     return Container(
//         padding: EdgeInsets.all(15),
//         color: Colors.black.withOpacity(0.5),
//         child: Column(
//           children: [
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Text(
//                 '0:0',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 26,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.w600,
//                   height: 0,
//                   letterSpacing: -0.26,
//                 ),
//               ),
//               Icon(
//                 Icons.menu,
//                 color: Colors.white,
//                 size: 40,
//               ),
//             ]),
//             SizedBox(
//               height: 30,
//             ),
//             Icon(
//               Icons.check,
//               color: Colors.white,
//               size: 100,
//             ),
//             SizedBox(
//               height: 35,
//             ),
//             Text(
//               '테니스 코트 인식을 성공했어요!\n무인 심판 기능을 시작할까요? ',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontFamily: 'Pretendard',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 35),
//             ElevatedButton(
//               child: Text(
//                 '무인심판 시작하기',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF464EFF),
//                   fontSize: 20,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: -0.20,
//                 ),
//               ),
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   minimumSize: Size(200, 50),
//                   shape: RoundedRectangleBorder(
//                       side: BorderSide(width: 1, color: Colors.white),
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//           ],
//         ));
//   }
//   // Todo : 4. Line Callling, Auto Scoring 화면 & 팝업

//   @override
//   Widget build(BuildContext context) {
//     Widget currentWidget;

//     switch (currentState) {
//       case 'fail':
//         currentWidget = courtDetectionFailWidget();
//         break;
//       case 'success':
//         currentWidget = courtDetectionSuccessWidget();
//         break;
//       case 'count':
//       default:
//         currentWidget = countWidget();
//         break;
//     }

//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: _controller.value.isInitialized
//                 ? CameraPreview(_controller)
//                 : Container(),
//           ),
//           Positioned(
//             top: 0,
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: currentWidget,
//           ),
//         ],
//       ),
//     );
//   }
// }
