class MatchInfoModel {
  // final String? nickname;
  // final String? major;
  // final String? gender;

  // MatchInfoModel({required this.nickname, required this.major, required this.gender});

  // factory MatchInfoModel.fromJson(Map<String, dynamic> json) {
  //   return MatchInfoModel(
  //       nickname: json['nickname'],
  //       major: json['major'],
  //       gender: json['gender']);
  // }
  // Map<String, dynamic> toJson() => {
  //       'nickname': nickname,
  //       'major': major,
  //       'gender': gender,
  //     };

  // String userId;
  String userId = "663a0b8954ded836e72ea57d";
  DateTime startTime;
  DateTime endTime;
  String objective;
  bool isSingles;
  List<String> dislikedCourts;
  int minTime;
  int maxTime;
  String reservationCourtId;
  DateTime reservationDate;
  int rentalCost;
  String description;

  MatchInfoModel({
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.objective,
    required this.isSingles,
    required this.dislikedCourts,
    required this.minTime,
    required this.maxTime,
    required this.reservationCourtId,
    required this.reservationDate,
    required this.rentalCost,
    required this.description,
  });

  // JSON 직렬화 메소드
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'objective': objective,
      'isSingles': isSingles,
      'dislikedCourts': dislikedCourts,
      'minTime': minTime,
      'maxTime': maxTime,
      'reservationCourtId': reservationCourtId,
      'reservationDate': reservationDate.toIso8601String(),
      'rentalCost': rentalCost,
      'description': description,
    };
  }
}
