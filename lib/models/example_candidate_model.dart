import 'dart:ffi';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:tennis_jamiss/models/enum/court_type.dart';
import 'package:tennis_jamiss/models/enum/match_objective.dart';

class ExampleCandidateModel {
  final Point<double> location; //위치 좌표
  final String courtName; //코트 이름
  final DateTime startTime; //시작 시간
  // var now = DateTime.now();

  final DateTime endTime; //종료 시간
  final bool isSingles; //단복식 여부
  final String ntrp; //NTRP 레벨
  final MatchObjective matchObjective; //매치 목적(진지한 정도)
  final CourtType courtType; //코트 타입

  final String decription; //한 줄 메세지

  // final List<Color> color;
  final AssetImage image; //테니스장 이미지

  ExampleCandidateModel({
    required this.location,
    required this.courtName,
    required this.startTime,
    required this.endTime,
    required this.isSingles,
    required this.ntrp,
    required this.matchObjective,
    required this.courtType,
    required this.decription,
    // required this.color, //테니스장 이미지
    required this.image,
  });
}

final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    location: Point(37.5665, 126.9780),
    courtName: '카일이네 테니스장',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    isSingles: true,
    ntrp: '4.0',
    matchObjective: MatchObjective.INTENSE,
    courtType: CourtType.HARD,
    decription: '테니스 치실 분 구합니다',
    // color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
    image: const AssetImage('assets/images/court_image/court1.jpeg'),
  ),
  ExampleCandidateModel(
    location: Point(37.5665, 126.9780),
    courtName: '재미없쓰 테니스장',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    isSingles: true,
    ntrp: '4.0',
    matchObjective: MatchObjective.INTENSE,
    courtType: CourtType.HARD,
    decription: '테니스 치실 분 구합니다',
    // color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
    image: const AssetImage('assets/images/court_image/court2.jpeg'),
  ),
  ExampleCandidateModel(
    location: Point(37.5665, 126.9780),
    courtName: '개비싼 테니스장',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    isSingles: true,
    ntrp: '4.0',
    matchObjective: MatchObjective.INTENSE,
    courtType: CourtType.HARD,
    decription: '테니스 치실 분 구합니다',
    // color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
    image: const AssetImage('assets/images/court_image/court3.jpeg'),
  ),
  ExampleCandidateModel(
    location: Point(37.5665, 126.9780),
    courtName: '테니스살인마 테니스장',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    isSingles: true,
    ntrp: '4.0',
    matchObjective: MatchObjective.INTENSE,
    courtType: CourtType.HARD,
    decription: '테니스 치실 분 구합니다',
    // color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
    image: const AssetImage('assets/images/court_image/court4.jpeg'),
  ),
];
