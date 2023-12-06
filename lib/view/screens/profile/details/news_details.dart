import 'package:assure_me/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import 'dart:convert';

class NewsDetails extends StatefulWidget {
  static const routeName = '/NewsDetails';
  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
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
                margin: EdgeInsets.only(top: scHeight / 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "News Item Title",
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: appcolor,
                          radius: 4,
                        ),
                        Text(
                          "  25/03/2023",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: exSmFontSize,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Container(
                      child: Divider(
                        color: appcolor,
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: scHeight / 1.5,
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ListView.builder(itemBuilder: (context, i) {
                    //   return;
                    // },itemCount: 2,),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: scWidth,
                      height: scHeight / 2,
                      color: appcolor,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: exSmFontSize,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                    ),
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
