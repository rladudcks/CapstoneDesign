import 'package:tennis_jamiss/services/entities/matching_infomation_entity.dart';
import 'package:tennis_jamiss/services/remote/match_client.dart';

abstract class Repository {
  Future<MatchingInformation> getMatchingInformation(int requestId);
}

class RepositoryImpl implements Repository {
  late final MatchClient _matchClient;

  RepositoryImpl(this._matchClient);

  @override
  Future<MatchingInformation> getMatchingInformation(int requestId) async {
    // local db 가 만약 있다면,
    final localData = await localDb.getMatchRequest(requestId);
    if (localData != null) {
      return Future.value(localData);
    } else {
      // local db 가 없다면, remote api 호출
      final dataFromNetwork = await _matchClient.getMatchRequest(requestId);
      // remote api 호출 후, local db 에 저장
      localDb.saveMatchRequest(dataFromNetwork);

      return dataFromNetwork;
    }
  }
}
