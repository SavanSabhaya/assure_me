import 'package:assure_me/view/screens/password/new_password.dart';
import 'package:assure_me/view/screens/password/password_controller.dart';
import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

class ChangePassword extends StatefulWidget {
  static const routeName = '/ChangePassword';
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _email = '';

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
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: lightGrey,
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: scWidth / 1.5,
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(
                        "Change Password",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Please enter the email associated with your AssureMe account",
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
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 25,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            child: TextFormField(
                              controller: emailController,
                              autofocus: false,
                              style:
                                  TextStyle(fontSize: 19.0, color: blackColor),
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
                                    if (emailController.text == '') {
                                      awesomeTopSnackbar(
                                          context, 'Please enter email');
                                    } else {
                                      PasswordController().forgotPasswordApi(
                                        emailAddress: emailController.text,
                                        context: context,
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: dfColor, fontSize: dfFontSize),
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
