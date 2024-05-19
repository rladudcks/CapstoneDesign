import 'dart:async';
import 'package:intl/intl.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadyToRefereeScreen extends StatefulWidget {
  ReadyToRefereeScreen({Key? key, required this.camera}) : super(key: key);
  // 첫 번째 카메라 정보 획득
  final CameraDescription camera;

  @override
  ReadyToRefereeScreenState createState() => ReadyToRefereeScreenState();
}

class ReadyToRefereeScreenState extends State<ReadyToRefereeScreen> {
  late CameraController _controller;

  // 점수
  int player1Score = 0;
  int player2Score = 0;

  // 녹화 시간
  String RecordTime = '';

  // 실행, 정지
  bool play = false;

  // 무인 심판 동작 유무
  bool isRefereeRunning = true;

  //타이머 작동
  int _counter = 30;
  Timer? _timer;
  String currentState = 'count';

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          currentState = 'fail';
          _stopTimer();
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(widget.camera, ResolutionPreset.high,
        enableAudio: false);
    await _controller.initialize();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _startTimer();
    _initializeCamera();
  }

  @override
  void dispose() {
    // 화면을 세로 방향으로 복구
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _stopTimer();
    _controller.dispose();
    super.dispose();
  }

  //녹화 시간
  void recordTime() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy.MM.dd HH:mm');
    setState(() {
      RecordTime = formatter.format(now);
    });
  }

  void _togglePlayPause() {
    setState(() {
      play = !play;
    });
    // 여기에 실제 재생/일시정지 기능을 구현
  }

  // 1. 카운트 화면
  Widget countWidget() {
    return Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(15),
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios, color: Colors.white))
                  ],
                ),
                Text(
                  '$_counter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 72,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '무인심판 AI 모델이 코트를 인식하고있어요 ... \n스마트폰을 고정해주세요',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  child: Text(
                    '중단하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF464EFF),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      currentState = 'fail';
                      _stopTimer();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(200, 50),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
        ),
    );
  }

  // 2. 카운트 만료 및 코트 인식 실패
  Widget courtDetectionFailWidget() {
    _stopTimer();
    return Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.black.withOpacity(0.5),
            child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios, color: Colors.white))
                      ],
                    ),
                    Text(
                      'AI모델의 테니스 코트\n인식이 실패했어요.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      '아래 다시하기 버튼을 눌러\n테니스 코트 인식을 진행해주세요',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      child: Text(
                        '다시하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF464EFF),
                          fontSize: 20,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.20,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          currentState = 'count';
                          _counter = 30;
                          _startTimer();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size(200, 50),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                )),
          )
    );
  }

  // 3. 카운트 내 코트 인식 성공
  Widget courtDetectionSuccessWidget() {
    _stopTimer();
    return Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(15),
          color: Colors.black.withOpacity(0.5),
          child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 100,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    '테니스 코트 인식을 성공했어요!\n무인 심판 기능을 시작할까요? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    child: Text(
                      '무인심판 시작하기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF464EFF),
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.20,
                      ),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(200, 50),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ],
              )),
        ),
    );
  }

  // Todo : 4. Line Callling, Auto Scoring 화면 & 팝업
  Widget RefereeWidget() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.all(15),
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,))
                  ],
                ),
                Text(
                  '$player1Score',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  ':',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '$player2Score',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  isRefereeRunning ? '무인 심판 진행 중...' : '무인 심판 정지',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                    RecordTime,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12),
                ),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = countWidget();
    switch (currentState) {
      case 'fail':
        currentWidget = courtDetectionFailWidget();
        break;
      case 'success':
        currentWidget = courtDetectionSuccessWidget();
        break;
      case 'referee':
        currentWidget = RefereeWidget();
        break;
      default:
        currentWidget = countWidget();
        break;
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _controller.value.isInitialized
                ? CameraPreview(_controller)
                : Container(),
          ),
          currentWidget,
        ],
      ),
    );
  }
}
