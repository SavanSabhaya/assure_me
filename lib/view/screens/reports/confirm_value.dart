import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

class ConfirmValue extends StatefulWidget {
  static const routeName = '/ConfirmValue';
  @override
  State<ConfirmValue> createState() => _ConfirmValueState();
}

class _ConfirmValueState extends State<ConfirmValue> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: applg),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: lightGrey,
                    child: Icon(
                      Icons.warning_amber_rounded,
                      color: appcolor,
                      size: 40,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  width: scWidth,
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Are you sure?",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "You are about to change the value of this device and when you will be notifed.",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: dfFontSize,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Do you accept and understand",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: dfFontSize,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 40, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              gradient: lgBlue,
                              borderRadius: BorderRadius.circular(50)),
                          width: scWidth / 3,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Accept',
                              style: TextStyle(
                                  color: dfColor,
                                  fontSize: dfFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: blackColor),
                              // gradient: lgBlue,
                              borderRadius: BorderRadius.circular(50)),
                          width: scWidth / 3,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: dfFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
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
