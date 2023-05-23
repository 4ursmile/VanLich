import 'dart:convert';

class JWTHelper {
  static String decode(String code) {
    String normalizedSource = base64Url.normalize(code.split(".")[1]);
    return utf8.decode(base64Url.decode(normalizedSource));
  }
}
