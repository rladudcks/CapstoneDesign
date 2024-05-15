import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

class RefereeScreen extends StatefulWidget  {
  final CameraDescription camera;

  const RefereeScreen({Key? key, required this.camera}) : super(key: key);

  @override
  RefereeScreenState createState() => RefereeScreenState();
}

class RefereeScreenState extends State<RefereeScreen> with WidgetsBindingObserver {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
  }

  Future<void> _startVideoRecording() async {
    if (!_isRecording) {
      final Directory appDirectory = await getApplicationDocumentsDirectory();
      final String videoDirectory = '${appDirectory.path}/Videos';
      await Directory(videoDirectory).create(recursive: true);
      final String currentTime =
          DateTime.now().millisecondsSinceEpoch.toString();
      final String filePath = '$videoDirectory/$currentTime.mp4';
      // Todo : filePath 작성

      setState(() {
        _isRecording = true;
      });
    }
  }

  Future<void> _stopVideoRecording() async {
    if (_isRecording) {
      await _controller.stopVideoRecording();
      setState(() {
        _isRecording = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: RotatedBox(
        quarterTurns: 1,
        child: Stack(
          children: [
            _controller.value.isInitialized
                ? FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: screenSize.height,
                    height: screenSize.width,
                    child: CameraPreview(_controller),
                  ),
            )
                : Container(),
            // 상단바 디자인
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 점수
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '2:0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    // 진행 상황 및 녹화 시간
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '진행 상황',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '13:30:31',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    // 메뉴 바
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // 메뉴 바 동작 처리
                      },
                    ),
                  ],
                ),
              ),
            ),
            // 하단 버튼
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isRecording = !_isRecording;
                  });
                  // 재생/일시정지 버튼 동작 처리
                },
                child: Container(
                  width: 40,
                  height: 40,
                  child: Icon(
                    _isRecording ? Icons.pause : Icons.play_arrow,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
