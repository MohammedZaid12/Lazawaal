import 'package:lazawaal/Lazawaal/CommonThings/AllInstances.dart';




class TokenWithHeader {
  authWithTokenHeaders(String token) {
    return {
      "PublicKey": appsettings.PUBLIC_KEY,
      "SecretKey": appsettings.SECRETE_KEY,
      "Content-Type": "application/x-www-form-urlencoded",
      "token": token
    };
  }
}