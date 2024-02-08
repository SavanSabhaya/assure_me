import 'package:flutter/material.dart';

const marginLR = 15.0;
const marginSet = 5.0; // If the marginLR add more 5 it's also increment 5

/// -------- Font Size
const double exXSmFontSize = 12.0;
const double exSmFontSize = 14.0;
const double dfFontSize = 16.0;
const double smFontSize = 18.0;
const double lgFontSize = 20.0;
const double exLgFontSize = 22.0;

///------- Icon Size
const double dfIconSize = 22;

const double dfElevation = 8.0;

///------- App Color

const dfColor = Colors.white;
const dfRed = Color.fromRGBO(223, 33, 38, 1);
const appcolor = Color.fromRGBO(176, 223, 253, 1);
const lightappcolor = Color.fromRGBO(127, 146, 179, 1);
const greyColor = Color.fromRGBO(245, 245, 245, 1);
const lightGrey = Color.fromRGBO(238, 238, 238, 1);
const drakGreyColor = Color.fromARGB(221, 194, 194, 194);
const btnTextColor = Colors.white;
const blackColor = Colors.black;
const redAlert = Color.fromRGBO(255, 241, 239, 1);
const yellowAlert = Color.fromRGBO(254, 247, 229, 1);
const blueAlert = Color.fromRGBO(243, 249, 250, 1);

const dfGreyColor = Color(0xfff1B1B1B);

///---------- Rounded Style

const roundBtn = 8.0;

/////

const lgBlue = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(176, 223, 253, 0.9),
      Color.fromRGBO(176, 223, 253, 1),
    ]);

const applg = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomRight,
  stops: [
    0.01,
    0.09,
    0.25,
  ],
  colors: [
    Color.fromRGBO(176, 223, 253, 0.6),
    Color.fromRGBO(176, 223, 253, 0.5),
    dfColor,
  ],
);

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);




class TokenExpiredDialog extends StatelessWidget {
  final VoidCallback onRedirectToLogin;

  TokenExpiredDialog({required this.onRedirectToLogin});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Alert"),
      content: Text("Your session has expired. Please log in again."),
      actions: <Widget>[
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the alert dialog
            onRedirectToLogin(); // Redirect to login page
          },
        ),
      ],
    );
  }
}