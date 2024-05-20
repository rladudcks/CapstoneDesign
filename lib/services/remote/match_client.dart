import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tennis_jamiss/services/entities/matching_infomation_entity.dart';

part 'match_client.g.dart';

@RestApi(baseUrl: 'https://api.tennis.com')
abstract class MatchClient {
  factory MatchClient(Dio dio, {String baseUrl}) = _MatchClient;

  // - **Endpoint**: **`/api/match/request: requestId`**
  // - **Method**: **`GET`**
  @GET('/api/match/:requestId')
  Future<MatchingInformation> getMatchRequest(@Path('requestId') int requestId);
}

class Example {
  void example() async {
    final dio = Dio(); // Provide a dio instance
    final client = MatchClient(dio);

    final matchRequest = await client.getMatchRequest(1);
    print(matchRequest);
  }
}
