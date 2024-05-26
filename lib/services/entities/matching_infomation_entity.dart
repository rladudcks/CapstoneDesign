// {
//     "isSuccess": true,
//     "code": "COMMON200",
//     "message": "성공입니다.",
//     "result": {
//         "id": "662def7e075c636050804ff9",
//         "userId": "662cda25e5c4314e868188d3",
//         "startTime": "2024-05-01T10:00:00",
//         "endTime": "2024-05-01T12:00:00",
//         "objective": "RALLY",
//         "isSingles": true,
//         "x": 126.887847771379,
//         "y": 37.5204279064529,
//         "dislikedCourts": [
//             "court1",
//             "court2"
//         ],
//         "maxDistance": 5.0,
//         "reservationDate": "2024-05-01T00:00:00.000+00:00",
//         "rentalCost": 20000,
//         "description": "테니스 랠리 연습을 위한 매치 요청"
//     }
// }
// Entity of MatchingInfomation
// JsonSerializable
import 'package:json_annotation/json_annotation.dart';

part 'matching_infomation_entity.g.dart';

@JsonSerializable()
class MatchingInformation {
  final String id;
  final String userId;
  final DateTime startTime;
  final DateTime endTime;
  final String objective;
  final bool isSingles;
  final double x;
  final double y;
  final List<String> dislikedCourts;
  final double maxDistance;
  final DateTime reservationDate;
  final int rentalCost;
  final String description;

  MatchingInformation({
    required this.id,
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.objective,
    required this.isSingles,
    required this.x,
    required this.y,
    required this.dislikedCourts,
    required this.maxDistance,
    required this.reservationDate,
    required this.rentalCost,
    required this.description,
  });

  factory MatchingInformation.fromJson(Map<String, dynamic> json) =>
      _$MatchingInfomationFromJson(json);
  Map<String, dynamic> toJson() => _$MatchingInfomationToJson(this);
}
