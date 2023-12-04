import 'package:assure_me/view/screens/dashboard/home_page.dart';
import 'package:assure_me/view/screens/login/login.dart';
import 'package:assure_me/view/screens/password/forgot_password.dart';
import 'package:assure_me/view/screens/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String homepage = '/HomePage';
  static const String forgotpassword = '/forgotpassword';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const Splash(),
    login: (context) => LogIn(),
    homepage: (context) => HomePage(),
    forgotpassword: (context) => ForgotPassword(),
  };
}
