import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadyToRefereeScreen extends StatefulWidget {
  final CameraDescription camera;

  const ReadyToRefereeScreen({Key? key, required this.camera}) : super(key: key);

  @override
  ReadyToRefereeScreenState createState() => ReadyToRefereeScreenState();
}

class ReadyToRefereeScreenState extends State<ReadyToRefereeScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _initializeCamera();
  }

  @override
  void dispose() {
    // 화면을 세로 방향으로 복구
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(widget.camera, ResolutionPreset.high,
        enableAudio: false);
    await _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _controller.value.isInitialized
              ? CameraPreview(_controller)
              : Container(),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top, // 노치나 스테이터스 바 고려
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.black.withOpacity(0.5),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0:0',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                Icon(Icons.menu)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
