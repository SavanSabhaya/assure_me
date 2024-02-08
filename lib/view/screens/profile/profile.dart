import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/password/change_password.dart';
import 'package:assure_me/view/screens/password/password_controller.dart';
import 'package:assure_me/view/screens/profile/model/profile_model.dart';
import 'package:assure_me/view/screens/profile/news.dart';
import 'package:assure_me/view/screens/profile/profile_controller.dart';
import 'package:assure_me/view/screens/profile/profile_edit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

class Profile extends StatefulWidget {
  static const routeName = '/Profile';
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  var preferences = MySharedPref();
  String _fname = '';
  String _lname = '';
  String _email = '';

  @override
  void initState() {
    super.initState();

    setState(() {
      ProfileController().profile(context:  context, setState: setState);
    });
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
                  alignment: Alignment.center,
                  // width: scWidth,
                  margin: EdgeInsets.only(top: scHeight / 15),
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                        color: dfColor,
                        fontSize: lgFontSize,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  // width: scWidth,
                  margin: EdgeInsets.only(
                      bottom: scHeight / 15, top: scHeight / 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        profileModel?.data?.name ?? '',
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
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
                          margin: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 30,
                                ),
                                decoration: BoxDecoration(
                                    gradient: lgBlue,
                                    borderRadius: BorderRadius.circular(20)),
                                width: scWidth,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProfileEdit(
                                                  firstname: profileModel
                                                      .data?.name,
                                                  lastname: profileModel
                                                      .data?.username,
                                                  email: profileModel
                                                      .data?.email,
                                                ))).then((value) {
                                      setState(() {
                                        ProfileController()
                                            .profile(context:  context, setState: setState);
                                      });
                                    });
                                  },
                                  child: Text(
                                    'Account Info',
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //////////////
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 30,
                                ),
                                decoration: BoxDecoration(
                                    gradient: lgBlue,
                                    borderRadius: BorderRadius.circular(20)),
                                width: scWidth,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePassword()));
                                  },
                                  child: Text(
                                    'Change Password',
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ///////////////////
                        // Container(
                        //   margin: EdgeInsets.only(top: 5),
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         margin: EdgeInsets.only(
                        //           bottom: 30,
                        //         ),
                        //         decoration: BoxDecoration(
                        //             gradient: lgBlue,
                        //             borderRadius: BorderRadius.circular(20)),
                        //         width: scWidth,
                        //         child: ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.push(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                     builder: (context) => News()));
                        //           },
                        //           child: Text(
                        //             'News',
                        //             style: TextStyle(
                        //                 color: dfColor,
                        //                 fontSize: dfFontSize,
                        //                 fontWeight: FontWeight.bold),
                        //           ),
                        //           style: ElevatedButton.styleFrom(
                        //             backgroundColor: Colors.transparent,
                        //             elevation: 0,
                        //             padding: EdgeInsets.symmetric(vertical: 18),
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        Container(
                          margin: EdgeInsets.only(top: scHeight / 8),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 30,
                                ),
                                decoration: BoxDecoration(
                                    gradient: lgBlue,
                                    borderRadius: BorderRadius.circular(20)),
                                width: scWidth,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ProfileController()
                                        .logoutApi(context: context);
                                  },
                                  child: Text(
                                    'Logout',
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
                                      borderRadius: BorderRadius.circular(20),
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
