import 'dart:async';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
//import '../../models/user.dart';
import '../connectivity/connectivity_service.dart';
//import '../../services/preference/preference.dart';
import 'package:flutter/cupertino.dart';
import 'api.dart';

class HttpApi {
  Dio _dio;
  APIState state = APIState.lazy;
  ConnectivityService connectivity;
  //stream allow to subscribe to connection changes
  StreamController<APIState> _stateStreamController =
      StreamController.broadcast();
  Stream<APIState> get stateChange => _stateStreamController.stream;

  HttpApi(BuildContext context) {
    connectivity = Provider.of(context, listen: false);
    setupDio();
  }

  setupDio() async {
    _dio = Dio(BaseOptions(connectTimeout: 10000, receiveTimeout: 10000));
    connectivity.connectivityStreamController.stream.listen((online) async {
      if (online) {
        //await loadBaseUrl();
        print("online");
      }
    });
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  ///🦄load server url from firestore
  /*  Future<void> loadBaseUrl() async {
    if (connectivity.connected) {
      Logger().wtf('🍉getting base url🍉');
      final doc = await Firestore.instance
          .collection('urls')
          .document('serverUrl')
          .get();
      final baseUrl = doc.data['url'] as String;

      print(baseUrl);
      Logger().wtf('🍉base url $baseUrl🍉');

      if (baseUrl != null) {
        await Preference.setString(PrefKeys.baseUrl, baseUrl);
        state = APIState.ready;
        _stateStreamController.sink.add(APIState.ready);
      }
    } else {
      Logger()
          .wtf('🍉cant load base url::offline::${connectivity.connected}🍉');
    }
  } */

  Future<dynamic> request(String url,
      {dynamic body,
      BuildContext context,
      Map<String, dynamic> headers,
      String type = RequestType.Get,
      Map<String, dynamic> queryParameters,
      String contentType = Headers.jsonContentType,
      ResponseType responseType = ResponseType.json}) async {
    Response response;
    final options = Options(
        headers: headers, contentType: contentType, responseType: responseType);
    await setupDio();

    ///load current server url
    final baseUrl = 'http://www.exa-tech.net/ci/index.php/Api/';

    //Logger().i('🍉request $baseUrl$url $headers');

    try {
      switch (type) {
        case RequestType.Get:
          {
            response = await _dio.get(baseUrl + url,
                queryParameters: queryParameters, options: options);
          }
          break;
        case RequestType.Post:
          {
            response = await _dio.post(baseUrl + url,
                queryParameters: queryParameters, data: body, options: options);
          }
          break;
        case RequestType.Put:
          {
            response = await _dio.put(baseUrl + url,
                queryParameters: queryParameters, data: body, options: options);
          }
          break;
        case RequestType.Delete:
          {
            response = await _dio.delete(baseUrl + url,
                queryParameters: queryParameters, data: body, options: options);
          }
          break;
        default:
          break;
      }

      if (response.statusCode == 200) {
        /// 🦄map of string dynamic...
        return response.data;
      } else {
        Logger().e('🌐🌐ERROR in http $type for $url:🌐🌐\n' +
            '${response.statusCode}: ${response.statusMessage} ${response.data}');
      }
    } on DioError catch (e) {
      Logger().e('🌐🌐DIO ERROR in http $type for $url:🌐🌐\n' +
          '${e.response.statusCode}: ${e.response.statusMessage} ${e.response.data}\n' +
          e.toString());
    }
    return null;
  }

  Future<bool> signUp(
      {String firstNameAr,
      String firstNameEn,
      String lastNameAr,
      String lastNameEn,
      String email,
      String password}) async {
    final body = {
      "first_name": firstNameAr,
      "last_name": generateMd5(lastNameAr),
      "first_name_en": firstNameEn,
      "last_name_en": lastNameEn,
      "email": email,
      "password": generateMd5(password)
    };
    try {
      final response =
          await request(EndPoint.REGISTER, type: RequestType.Post, body: body);
      print(response["status"]["code"].toString());
      if (response != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> signIn(
      {@required String username, @required String password}) async {
    print("signin");
    final body = {
      "username": username,
      "password": password
    }; //generateMd5(password)
    final response = await request(EndPoint.LOGIN,
        type: RequestType.Post,
        body: body,
        headers: Header.clientAuth,
        contentType: Headers.formUrlEncodedContentType);
    print(response["status"]["code"].toString());
    print("sdsd");
    /* final token = tokenResponse["access_token"];

    if (token == null) {
      return null;
    }

    await Preference.setString(PrefKeys.token, token);

    final response = await request(EndPoint.USER + '/data',
        type: RequestType.Post, headers: Header.userAuth);
    if (response['id'] != null) {
      return User.fromJson(response);
    } else {
      return null;
    } */
  }
}
