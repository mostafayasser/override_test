import 'package:flutter/material.dart';

import '../pages/main_pages/splash_screen.dart';
import '../pages/main_pages/signIn_screen.dart';
import '../pages/main_pages/signUp_screen.dart';
import '../pages/main_pages/home_page_screen.dart';
import '../pages/main_pages/map_screen.dart';

class Routes {
  static Widget get splash => SplashScreen();
  static Widget get signIn => SignInScreen();
  static Widget get homePage => HomePageScreen();
  static Widget get signUp => SignUpScreen();
  static Widget get map => MapScreen();
}
