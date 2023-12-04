import 'package:assure_me/constant.dart';
import 'package:assure_me/view/screens/dashboard/main_menu_detail/store_name_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import 'dart:convert';

class StoreName extends StatefulWidget {
  static const routeName = '/StoreName';
  @override
  State<StoreName> createState() => _StoreNameState();
}

class _StoreNameState extends State<StoreName> {
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
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: scWidth / 3,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                    alignment: Alignment.center,
                    width: scWidth / 3,
                    margin: EdgeInsets.only(top: scHeight / 15),
                    child: Text(
                      "Store Name",
                      style: TextStyle(
                          color: blackColor,
                          fontSize: lgFontSize,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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
                    AlertCard(),
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
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StoreNameDetail()));
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Container(
          padding: EdgeInsets.all(20),
          width: scWidth,
          height: scHeight / 7,
          decoration: BoxDecoration(
              color: appcolor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Device Name",
                    style: TextStyle(
                        color: dfColor,
                        fontSize: lgFontSize,
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.arrow_outward_rounded,
                    color: dfColor,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Device Location",
                    style: TextStyle(
                        color: dfColor,
                        fontSize: exXSmFontSize,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "25°C",
                    style: TextStyle(
                        color: dfColor,
                        fontSize: exSmFontSize,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
