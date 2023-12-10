import 'package:assure_me/constant.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/view/screens/login/login.dart';
import 'package:assure_me/view/screens/splash/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorWidget = CircularProgressIndicator(color: appcolor)
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ASSURE ME',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appcolor),
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,
      builder: EasyLoading.init(),
      initialRoute: AppRoutes.splash,
      // home: LogIn(),
    );
  }
}
