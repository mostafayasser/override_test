import 'dart:convert';

import '../../models/user.dart';
import '../api/http_api.dart';
//import '../../../ui/routes/routes.dart';
//import '../../../ui/shared/ui.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../preference/preference.dart';

class AuthenticationService {
  final HttpApi api;

  User _user;
  User get user => _user;

  AuthenticationService({this.api}) {
    loadUser;
  }

  /*
   * authenticate user by his phone number and password
   */
  Future login(
      {@required String username,
      @required String password,
      String macAddress}) async {
    /* try {
      _user = await api.signIn(username: username, password: password);

      if (_user != null) {
        Logger().i(_user.toJson());
        saveUser(user: _user);
      }
    } catch (e) {
      Logger().e(e);
    } */
  }

  /*
   * change authenticated user password
   * return false if not authenticated
   */
  Future<bool> changeUserPassword(
      {@required BuildContext context,
      @required String oldPassword,
      @required String newPassword}) async {
    if (user != null) {
      // return await api.changePassword(context: context, phone: _user.username, oldPassword: oldPassword, newPassword: newPassword, token: _user.token);
    } else {
      return null;
    }
  }

  /*
   *check if user is authenticated 
   */
  bool get userLoged => Preference.getBool(PrefKeys.userLogged) ?? false;

  /*
   *save user in shared prefrences 
   */
  saveUser({User user}) {
    Preference.setBool(PrefKeys.userLogged, true);
    Preference.setString(PrefKeys.userData, json.encode(user.toJson()));
  }

  /*
   * load the user info from shared prefrence if existed to be used in the service   
   */
  Future<void> get loadUser async {
    if (userLoged) {
      _user =
          User.fromJson(json.decode(Preference.getString(PrefKeys.userData)));
      Logger().i(_user.toJson());
      print('\n\n\n\n');
    }
  }

  /*
   * signout the user from the app and return to the login screen   
   */
  Future<void> get signOut async {
    await Preference.sb.clear();
    _user = null;
  }
}
