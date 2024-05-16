import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tennis_jamiss/screens/referee/ready_referee_screen.dart';

class RefereeScreen extends StatefulWidget {
  // 무인 심판 첫 화면
  static const routeName = '/RefereeScreen';
  final CameraDescription camera;

  const RefereeScreen({Key? key, required this.camera}) : super(key: key);

  @override
  RefereeScreenState createState() => RefereeScreenState();
}

class RefereeScreenState extends State<RefereeScreen> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    await _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.videocam_outlined,
                  size: 100,
                  color: Colors.black,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "무인심판을\n시작합니다",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: -0.26,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text("스마트폰을 가로로 거치해주세요!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.14,
                    )),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text(
                    '시작하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadyToRefereeScreen(camera: _cameras.first,)));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(200, 50),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ]),
        );
  }
}
