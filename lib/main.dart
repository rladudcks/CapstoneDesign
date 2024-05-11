import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart';
import 'package:tennis_login/login_and_signup/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

// void main() {
//   runApp(MyApp());
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        title: 'TennisJamiss',
        theme: ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: LogIn(key: UniqueKey()));
  }
}
