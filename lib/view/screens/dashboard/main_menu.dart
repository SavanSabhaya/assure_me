import 'package:assure_me/constant.dart';
import 'package:assure_me/view/screens/dashboard/main_menu_detail/store_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import 'dart:convert';

class MainMenu extends StatefulWidget {
  static const routeName = '/MainMenu';
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final _formKey = GlobalKey<FormState>();
  // String _fname = '';
  // String _lname = '';
  // String _email = '';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                // width: scWidth,
                margin: EdgeInsets.only(top: scHeight / 15),
                child: Text(
                  "Main menu",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: lgFontSize,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: scHeight / 25),
                height: scHeight / 1.5,
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ListView.builder(itemBuilder: (context, i) {
                    //   return;
                    // },itemCount: 2,),
                    AlertCard(),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  const AlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StoreName()));
      },
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Container(
        padding: EdgeInsets.all(20),
        width: scWidth,

        // height: scHeight / ,
        decoration: BoxDecoration(
            color: appcolor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "STORE NAME",
              style: TextStyle(
                  color: dfColor,
                  fontSize: exLgFontSize,
                  fontWeight: FontWeight.w700),
            ),
            Icon(
              Icons.arrow_outward_rounded,
              color: dfColor,
            )
          ],
        ),
      ),
    );
  }
}
