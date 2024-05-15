class CourtType {
  static const CLAY = CourtType('CLAY');
  static const HARD = CourtType('HARD');
  static const GRASS = CourtType('GRASS');

  final String _value;
  const CourtType(this._value);

  static List<CourtType> get values => [CLAY, HARD, GRASS];

  @override
  String toString() => _value;

  factory CourtType.fromJson(String json) {
    if (json == 'CLAY') {
      return CLAY;
    } else if (json == 'HARD') {
      return HARD;
    } else if (json == 'GRASS') {
      return GRASS;
    } else {
      throw Error();
    }
  }
  String toJson() => toString();
}
