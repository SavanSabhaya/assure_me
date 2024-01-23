import 'dart:async';

import 'package:assure_me/constant.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/dashboard/aleart_page.dart';
import 'package:assure_me/view/screens/dashboard/home_page.dart';
import 'package:assure_me/view/screens/dashboard/model/deviceList_model.dart';
import 'package:assure_me/view/screens/login/login.dart';
import 'package:assure_me/view/screens/password/code.dart';
import 'package:assure_me/view/screens/password/forgot_password.dart';
import 'package:assure_me/view/screens/password/new_password.dart';
import 'package:assure_me/view/screens/splash/splash_controller.dart';
import 'package:assure_me/view/widgets/grident_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String bearerToken = '';
bool keepLogin = false;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var preferences = MySharedPref();
  SplashContrller splashContrller = SplashContrller();
  dynamic deviceListModel;

  @override
  void initState() {
    super.initState();

    preferences.getStringValue(SharePreData.keytoken).then((token) {
      setState(() {
        bearerToken = token;
        print('is get token =====>>>$bearerToken');
      });
    });
    preferences.getBoolValue(SharePreData.keyKeepLogin).then((value) {
      if (value != null) {
        setState(() {
          keepLogin = value;
          print('is keep login  =====>>>$keepLogin');
        });
      }
    });
    // splashContrller.deviceList(context: context, setState: setState);
    Timer(const Duration(seconds: 4), () {
      checkSessionStatus();
    });
  }

  Future<void> checkSessionStatus() async {
    if (keepLogin) {
      if (bearerToken == '') {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => AlertsPage()));
        Navigator.pushNamed(context, AppRoutes.login);
      } else {
        // splashContrller.deviceList(context: context, setState: setState);
        // print(
        // 'get device list ===>>${splashContrller.deviceListModel.data?[0].deviceName}');
        // for (var i = 0; i < splashContrller.deviceListModel.data!.length; i++) {
        //   if (splashContrller.deviceListModel.data?[i].status == 0) {
        //     showDialog(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return AlertDialog(
        //           title: Text("Alert"),
        //           content: Text(
        //               "The ${splashContrller.deviceListModel.data?[i].deviceName} is offline at the moment."),
        //           actions: [
        //             TextButton(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //                 Navigator.pushNamed(context, AppRoutes.homepage);
        //               },
        //               child: Text("OK"),
        //             ),
        //           ],
        //         );
        //       },
        //     );
        //   }
        // }

        Navigator.pushNamed(context, AppRoutes.homepage);
      }
    } else {
      Navigator.pushNamed(context, AppRoutes.login);
    }
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
                // Row(
                //   // crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "ASSURE",
                //       style: GoogleFonts.sofiaSansCondensed(
                //         textStyle: Theme.of(context).textTheme.displayLarge,
                //         fontSize: 60,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     GradientText(
                //       'ME',
                //       style: GoogleFonts.sofiaSansCondensed(
                //         textStyle: Theme.of(context).textTheme.displayLarge,
                //         fontSize: 60,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       gradient: LinearGradient(colors: [
                //         Colors.red.shade200,
                //         Colors.red.shade900,
                //       ]),
                //     ),
                //   ],
                // ),
              ],
            ),
          )),
    );
  }
}
