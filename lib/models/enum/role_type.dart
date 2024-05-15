// ignore_for_file: constant_identifier_names

class RoleType {
  static const ADMIN_USER = RoleType('ADMIN_USER');
  static const GENERAL_USER = RoleType('GENERAL_USER');
  static const BUSINESS_USER = RoleType('BUSINESS_USER');

  final String _value;
  const RoleType(this._value);

  static List<RoleType> get values => [ADMIN_USER, GENERAL_USER, BUSINESS_USER];

  @override
  String toString() => _value;

  factory RoleType.fromJson(String json) {
    if (json == 'ADMIN_USER') {
      return ADMIN_USER;
    } else if (json == 'GENERAL_USER') {
      return GENERAL_USER;
    } else if (json == 'BUSINESS_USER') {
      return BUSINESS_USER;
    } else {
      throw Error();
    }
  }
  String toJson() => toString();
}
