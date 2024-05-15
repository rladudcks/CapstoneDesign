class MatchObjective {
  static const INTENSE = MatchObjective('INTENSE');
  static const FUN = MatchObjective('FUN');
  static const ANY = MatchObjective('ANY');
  static const RALLY = MatchObjective('RALLY');
  static const SERVE = MatchObjective('SERVE');

  final String _value;
  const MatchObjective(this._value);

  static List<MatchObjective> get values => [INTENSE, FUN, ANY, RALLY, SERVE];

  @override
  String toString() => _value;

  factory MatchObjective.fromJson(String json) {
    if (json == 'INTENSE') {
      return INTENSE;
    } else if (json == 'FUN') {
      return FUN;
    } else if (json == 'ANY') {
      return ANY;
    } else if (json == 'RALLY') {
      return RALLY;
    } else if (json == 'SERVE') {
      return ANY;
    } else {
      throw Error();
    }
  }
  String toJson() => toString();
}
