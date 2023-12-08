import 'package:assure_me/view/screens/dashboard/home_page.dart';
import 'package:assure_me/view/screens/login/login.dart';
import 'package:assure_me/view/screens/password/code.dart';
import 'package:assure_me/view/screens/password/forgot_password.dart';
import 'package:assure_me/view/screens/password/new_password.dart';
import 'package:assure_me/view/screens/profile/profile.dart';
import 'package:assure_me/view/screens/profile/profile_edit.dart';
import 'package:assure_me/view/screens/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String homepage = '/HomePage';
  static const String forgotpassword = '/forgotpassword';
  static const String otpCode = '/otpcode';
  static const String newPassword = '/NewPassword';
  static const String profile = '/Profile';
  static const String profileEdit = '/ProfileEdit';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const Splash(),
    login: (context) => LogIn(),
    homepage: (context) => HomePage(),
    forgotpassword: (context) => ForgotPassword(),
    otpCode: (context) => OtpCode(),
    newPassword: (context) => NewPassword(),
    profile: (context) => Profile(),
    profileEdit: (context) => ProfileEdit(),
  };
}
