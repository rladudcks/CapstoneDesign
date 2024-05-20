import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'match_client.g.dart';

@RestApi(baseUrl: "http://localhost:3000")
abstract class MatchClient {
  factory MatchClient(Dio dio, {String baseUrl}) = _MatchClient;
}

class Example {
  void example() async {
    final dio = Dio();
    final client = MatchClient(dio);
    final response = await client.getMatchInfo();
    print(response.data);
  }
}
