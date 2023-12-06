import 'package:assure_me/view/screens/profile/details/news_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

class News extends StatefulWidget {
  static const routeName = '/News';
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
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
        decoration: BoxDecoration(gradient: applg),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          // alignment: Alignment.center,
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
                        color: dfColor,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                            color: dfColor,
                            fontSize: lgFontSize,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                // width: scWidth,
                margin:
                    EdgeInsets.only(bottom: scHeight / 15, top: scHeight / 25),
                child: Text(
                  "News",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                child: SingleChildScrollView(
                    child: Column(children: [
                  // ListView.builder(itemBuilder: (context, i) {
                  //   return;
                  // },itemCount: 2,),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDetails()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: dfColor,
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: ListTile(
                        leading: CircleAvatar(backgroundColor: drakGreyColor),
                        title: Text(
                          "News Item Title",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: dfFontSize,
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          "Preview Text",
                          style: TextStyle(
                              color: drakGreyColor,
                              fontSize: exXSmFontSize,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: Text(
                          "25/02/2023",
                          style: TextStyle(
                              color: drakGreyColor,
                              fontSize: exXSmFontSize,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
