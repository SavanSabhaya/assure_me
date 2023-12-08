import 'dart:async';

import 'package:assure_me/constant.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/dashboard/home_page.dart';
import 'package:assure_me/view/screens/login/login.dart';
import 'package:assure_me/view/screens/password/code.dart';
import 'package:assure_me/view/screens/password/forgot_password.dart';
import 'package:assure_me/view/screens/password/new_password.dart';
import 'package:assure_me/view/widgets/grident_text.dart';
import 'package:flutter/material.dart';

String bearerToken = '';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var preferences = MySharedPref();
  @override
  void initState() {
    super.initState();

    preferences.getStringValue(SharePreData.keytoken).then((token) {
      setState(() {
        bearerToken = token;
      });
    });
    Timer(const Duration(seconds: 4), () => checkSessionStatus());
  }

  Future<void> checkSessionStatus() async {
    Navigator.pushNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          // Adjust the height as needed
          color: dfColor, // Container background color
          child: Container(
            margin: EdgeInsets.symmetric(vertical: marginLR),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asserts/icons/icon.png',
                  width: scWidth / 1.8,
                  // height: 220,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ASSURE",
                      /*  style: GoogleFonts.sofiaSansCondensed(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ), */
                    ),
                    GradientText(
                      'ME',
                      /*  style: GoogleFonts.sofiaSansCondensed(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ), */
                      gradient: LinearGradient(colors: [
                        Colors.red.shade200,
                        Colors.red.shade900,
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
