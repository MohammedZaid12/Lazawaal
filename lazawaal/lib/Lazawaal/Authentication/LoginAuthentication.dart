int getInt(dynamic number) {
  if (number != null) {
    return ((number is String)) ? (int.tryParse(number) ?? 0) : number;
  }
  return 0;
}

double getDouble(dynamic number) {
  return (number == null) ? 0.0 : number.toDouble();
}

String getString(dynamic string) {
  return (string != null) ? string.toString() : "";
}

class LoginAuth {
  final String token;
  final int user_id;
  final String name;
  final String email;
  final String picture;
  final int authority_id;
  final String authority_name;
  final int user_type_id;
  final String user_type_name;

  LoginAuth(
      {this.token,
      this.user_id,
      this.name,
      this.email,
      this.picture,
      this.authority_id,
      this.authority_name,
      this.user_type_id,
      this.user_type_name});

  factory LoginAuth.fromjson(Map<String, dynamic> json) {
    var log = LoginAuth(
      token: getString(json["token"]),
      user_id: getInt(json["user_id"]),
      name: getString(json["name"]),
      email: getString(json["email"]),
      picture: getString(json["picture"]),
      authority_id: getInt(json["authority_id"]),
      authority_name: getString(json["authority_name"]),
      user_type_id: getInt(json["user_type_id"]),
      user_type_name: getString(json["user_type_name"]),
    );
    return log;

  }
}
