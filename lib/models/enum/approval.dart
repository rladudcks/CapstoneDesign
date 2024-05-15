// ignore_for_file: constant_identifier_names

class Approval {
  static const MATCHED = Approval('MATCHED');
  static const PENDING = Approval('PENDING');
  static const NOT_MATCHED = Approval('NOT_MATCHED');

  final String _value;
  const Approval(this._value);

  static List<Approval> get values => [MATCHED, PENDING, NOT_MATCHED];

  @override
  String toString() => _value;

  factory Approval.fromJson(String json) {
    if (json == 'MATCHED') {
      return MATCHED;
    } else if (json == 'PENDING') {
      return PENDING;
    } else if (json == 'NOT_MATCHED') {
      return NOT_MATCHED;
    } else {
      throw Error();
    }
  }

  String toJson() => toString();
}
