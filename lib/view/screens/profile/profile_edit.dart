import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/view/screens/profile/profile_controller.dart';
import 'package:assure_me/view/screens/splash/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

class ProfileEdit extends StatefulWidget {
  String? firstname;
  String? lastname;
  String? email;
  ProfileEdit({this.firstname, this.lastname, this.email});
  static const routeName = '/ProfileEdit';
  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String _fname = '';
  String _lname = '';
  String _email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      firstnameController.text = widget.firstname.toString();
      lastnameController.text = widget.lastname.toString();
      emailController.text = widget.email.toString();
    });
  }

  Future<void> updateProfile(
      {String? bearerToken1, String? newName, String? newEmail}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.updateProfile;
    final Map<String, dynamic> bodyParams = {
      'name': newName,
      'email': newEmail,
      // Add any other parameters you want to update in the profile
    };
    print('get body for edit profile ${bodyParams}');
    EasyLoading.show();
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      },
      body: jsonEncode(bodyParams),
    );

    if (response.statusCode == 200) {
      print('Profile updated successfully${response.body}');
      EasyLoading.dismiss();
      Navigator.pop(context);
    } else {
      print('Failed to update profile. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: scHeight,
        decoration: BoxDecoration(gradient: applg),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          // alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  // width: scWidth,
                  margin:
                      EdgeInsets.only(bottom: scHeight / 15, top: scHeight / 6),
                  child: Text(
                    "Account Info",
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
                            top: 20,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            child: TextFormField(
                              controller: firstnameController,
                              autofocus: false,
                              style:
                                  TextStyle(fontSize: 19.0, color: blackColor),
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "First Name",
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
                        ),
                        //////////////////
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            child: TextFormField(
                              controller: lastnameController,
                              autofocus: false,
                              style:
                                  TextStyle(fontSize: 19.0, color: blackColor),
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Last Name",
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
                        ),
                        //////////////////
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
                          margin: EdgeInsets.only(top: scHeight / 10),
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
                                    /* ProfileController().profileEdit(
                                        firstnameController.text,
                                        emailController.text); */
                                    setState(() {
                                      updateProfile(
                                          newEmail: emailController.text,
                                          newName: firstnameController.text);
                                    });
                                  },
                                  child: Text(
                                    'Go Back',
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
