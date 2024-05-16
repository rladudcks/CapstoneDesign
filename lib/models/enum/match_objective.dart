class MatchObjective {
  static const INTENSE = MatchObjective('INTENSE');
  static const FUN = MatchObjective('FUN');
  static const ANY = MatchObjective('ANY');

  final String _value;
  const MatchObjective(this._value);

  static List<MatchObjective> get values => [INTENSE, FUN, ANY];

  @override
  String toString() => _value;

  factory MatchObjective.fromJson(String json) {
    if (json == 'INTENSE') {
      return INTENSE;
    } else if (json == 'FUN') {
      return FUN;
    } else if (json == 'ANY') {
      return ANY;
    } else {
      throw Error();
    }
  }
  String toJson() => toString();
}
