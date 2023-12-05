import 'package:assure_me/api_%20service/service.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/view/screens/login/login_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

class LogIn extends StatefulWidget {
  static const routeName = '/login';

  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailAddress=TextEditingController();
  TextEditingController password=TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _showPassword = false;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailAddress.text="raj@gmail.com";
    password.text='Test@123';
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 120),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'asserts/icons/icon.png',
                  width: scWidth / 2,
                ),
              ),
              Container(
                width: scWidth / 2.5,
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      thickness: 2,
                      color: appcolor,
                    ),
                  ],
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
                          left: 25,
                          right: 25,
                          top: 25,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          child: TextFormField(
                            controller: emailAddress,
                            autofocus: false,
                            style: TextStyle(fontSize: 19.0, color: blackColor),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Email",
                              hintStyle: TextStyle(color: drakGreyColor),
                              fillColor: lightGrey,
                              contentPadding: const EdgeInsets.all(16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
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
                      ),
                      //////////////////
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25, top: 20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: TextFormField(controller: password,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 19.0, color: blackColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: drakGreyColor),
                                  fillColor: lightGrey,
                                  contentPadding: const EdgeInsets.all(16),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.circular(roundBtn),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.circular(roundBtn),
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
                                obscureText:
                                    !_showPassword, // Toggle visibility
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _password = value.trim();
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 30,
                              ),
                              child: Row(
                                children: [
                                  RoundCheckBox(
                                      size: 25,
                                      checkedColor: appcolor,
                                      onTap: (selected) {}),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Stay Logged In",
                                      style: TextStyle(
                                        color: blackColor,
                                        letterSpacing: 1.5,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                LoginController().loginApi(emailAddress: emailAddress.text,password:password.text,context:context,setState:  setState);
                                 /*  Navigator.pushNamed(
                                      context, AppRoutes.homepage); */
                                },
                                child: Text(
                                  'LogIn',
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
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.forgotpassword);
                              },
                              child: Container(
                                child: Text(
                                  "FORGOT PASSWORD",
                                  style: TextStyle(
                                    color: blackColor,
                                    letterSpacing: 1.5,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
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
    );
  }
}