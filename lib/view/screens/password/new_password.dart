import 'package:assure_me/view/screens/dashboard/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

class NewPassword extends StatefulWidget {
  static const routeName = '/NewPassword';
  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  String _pass = '';
  String _confpass = '';
  bool _showPassword = false;
  bool _showConfPassword = false;

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
                  alignment: Alignment.center,
                  width: scWidth / 1.5,
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(
                        "New Password",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Please enter your new password",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: dfFontSize,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(fontSize: 19.0, color: blackColor),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "New Password",
                              hintStyle: TextStyle(color: drakGreyColor),
                              fillColor: lightGrey,
                              contentPadding: const EdgeInsets.all(16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(roundBtn),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(roundBtn),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                            ),
                            obscureText: !_showPassword, // Toggle visibility
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your new password';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _pass = value.trim();
                              });
                            },
                          ),
                        ),
                        //////////////////
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            autofocus: false,
                            style: TextStyle(fontSize: 19.0, color: blackColor),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: drakGreyColor),
                              fillColor: lightGrey,
                              contentPadding: const EdgeInsets.all(16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(roundBtn),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(roundBtn),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _showConfPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showConfPassword = !_showConfPassword;
                                  });
                                },
                              ),
                            ),
                            obscureText:
                                !_showConfPassword, // Toggle visibility
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your confirm password';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _pass = value.trim();
                              });
                            },
                          ),
                        ),
                        //////////////////
                        Container(
                          margin: EdgeInsets.only(top: 20),
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
            context, MaterialPageRoute(builder: (context) => HomePage()));
                                  },
                                  child: Text(
                                    'Next',
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
