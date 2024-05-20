// ViewModel of MatchInfoView
// extends ChangeNotifier
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tennis_jamiss/data/repository.dart';
import 'package:tennis_jamiss/services/entities/matching_infomation_entity.dart';
import 'package:tennis_jamiss/services/remote/match_client.dart';

class MatchInfoViewModel extends ChangeNotifier {
  final MatchClient _matchClient = MatchClient(
    Dio(),
  );
  late final Repository _matchInfoRepository = RepositoryImpl(
    _matchClient,
  );
  final List<MatchingInformation> matchInfoList = [];

  bool get isFetched => matchInfoList.isNotEmpty;

  MatchInfoViewModel() {
    getMatchInfoList();
  }

  Future<void> getMatchInfoList() async {
    final matchInfo = await _matchInfoRepository.getMatchingInformation(1);
    matchInfoList.add(matchInfo);
    notifyListeners(); // UI update 신호
  }
}
