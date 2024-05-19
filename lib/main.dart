import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:tennis_jamiss/screens/business_user/bus_main_screens.dart';
import 'package:tennis_jamiss/screens/login_and_signup/LogIn.dart';
import 'package:tennis_jamiss/screens/referee/referee_screen.dart';
import 'package:tennis_jamiss/theme.dart';
import 'package:camera/camera.dart';

// void main() {
//   runApp(MyApp());`
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'TennisJamiss',
//       theme: ThemeData(
//         primaryColor: Colors.white,
//         visualDensity: VisualDensity.adaptivePlatformDensity
//       ),
//       home: LogIn(key: UniqueKey())
//     );
//   }
// }
List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 사용 가능한 카메라 목록을 가져옵니다.
  // final cameras = await availableCameras();

  // 첫 번째 카메라를 기본 카메라로 선택합니다.
  // final firstCamera = cameras.first;

  await dotenv.load(fileName: 'assets/env/.env');

  /// 라이브러리 메모리에 appKey 등록
  /// rest api 호출시 필요한 BASE_URL 도 등록해 주세요.
  /// 지도가 호출되기 전에만 세팅해 주면 됩니다.
  /// dotEnv 대신 appKey 를 직접 넣어주셔도 됩니다.
  AuthRepository.initialize(
    appKey: dotenv.env['APP_KEY'] ?? '',
    // baseUrl: dotenv.env['BASE_URL'] ?? ''
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TennisJamiss', theme: theme(), home: LogIn(key: UniqueKey())

        //사업자 화면 테스트
        // home: BusMainScreens()

        //관리자 화면 테스트
        // home: LogIn(key: UniqueKey())

        );
  }
}
