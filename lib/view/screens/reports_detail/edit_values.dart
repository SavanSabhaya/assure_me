import 'package:assure_me/view/screens/dashboard/home_page.dart';
import 'package:assure_me/view/screens/reports/success_value.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

class EditValues extends StatefulWidget {
  static const routeName = '/EditValues';
  @override
  State<EditValues> createState() => _EditValuesState();
}

class _EditValuesState extends State<EditValues> {
  final _formKey = GlobalKey<FormState>();
  String _fname = '';
  String _lname = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: scHeight,
        // decoration: BoxDecoration(gradient: applg),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          // alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: scWidth / 4,
                  margin: EdgeInsets.only(top: scHeight / 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.all(0)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: blackColor,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: lgFontSize,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  // width: scWidth,
                  margin: EdgeInsets.only(
                      bottom: scHeight / 15, top: scHeight / 25),
                  child: Text(
                    "Edit Values",
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 00,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Traget temperature",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: smFontSize,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Enter the traget temperature in *C",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: TextFormField(
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 19.0, color: blackColor),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "25",
                                    hintStyle: TextStyle(color: drakGreyColor),
                                    fillColor: lightGrey,
                                    contentPadding: const EdgeInsets.all(16),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _fname = value.trim();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        //////////////////
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Max temperature",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Enter the maximum temperature in *C that if reached you will be notifed",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: TextFormField(
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 19.0, color: blackColor),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "27",
                                    hintStyle: TextStyle(color: drakGreyColor),
                                    fillColor: lightGrey,
                                    contentPadding: const EdgeInsets.all(16),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your last name';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _lname = value.trim();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        //////////////////
                        Container(
                          margin: EdgeInsets.only(
                            top: 25,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Min temperature",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Enter the minimum temperature in *C that if reached you will be notifed",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: TextFormField(
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 19.0, color: blackColor),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "23",
                                    hintStyle: TextStyle(color: drakGreyColor),
                                    fillColor: lightGrey,
                                    contentPadding: const EdgeInsets.all(16),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _email = value.trim();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        //////////////////

                        Container(
                          margin: EdgeInsets.only(top: scHeight / 25),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 30,
                                ),
                                decoration: BoxDecoration(
                                    gradient: lgBlue,
                                    borderRadius: BorderRadius.circular(50)),
                                width: scWidth,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SuccessValue()));
                                  },
                                  child: Text(
                                    'Save Changes',
                                    style: TextStyle(
                                        color: dfColor,
                                        fontSize: dfFontSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(vertical: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
