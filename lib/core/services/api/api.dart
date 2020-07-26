import '../preference/preference.dart';

class RequestType {
  static const String Get = 'get';
  static const String Post = 'post';
  static const String Put = 'put';
  static const String Delete = 'delete';
}

class Header {
  static Map<String, dynamic> get clientAuth {
    // final hashedClient = const Base64Encoder().convert("$clientID:".codeUnits);
    return {'s_udid': 'abc'};
  }

  static Map<String, dynamic> get userAuth =>
      {'Authorization': 'Bearer ${Preference.getString(PrefKeys.token)}'};

  static Map<String, dynamic> get homePageHeaders =>
      {'s_udid': '132', 'Token': '1012dc1ce1d5ef1ae0db26e7909483ba5'};
}

class EndPoint {
  static const String REGISTER = 'register';
  static const String LOGIN = 'login';
  static const String USER = 'user';
  static const String HOME = 'mainCategory';
}

enum APIState { lazy, ready }

abstract class Api {}
