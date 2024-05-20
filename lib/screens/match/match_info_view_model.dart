import 'package:flutter/material.dart';

class MatchInfoViewModel extends ChangeNotifier{

  final MatchClient _matchClient

  late final Repository _matchInfoRepository; = RepositoryImpl(MatchClient(Dio()));

  final List<MatchingInformation> matchInfoList = [];

  bool get isFetched => matchInfoList.isNotEmpty;

  MatchInfoViewModel(){
    getMatchInfoList();
  }

  Futuer<void> getMatchInfoList() async {
    final matchInfo = await _matchInfoRepository.getMatchInfo(1);
    matchInfoList.add(matchInfo);
    notifyListeners();
  }
}