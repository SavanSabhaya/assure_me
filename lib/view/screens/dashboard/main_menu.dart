import 'package:assure_me/constant.dart';
import 'package:assure_me/view/screens/dashboard/main_menu_detail/store_name.dart';
import 'package:assure_me/view/screens/profile/profile_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      ProfileController().profile( context:  context, setState: setState);
    });
  }

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
              Visibility(
                visible: profileModel.data?.subUsers?.length == 0
                    ? false
                    : true ?? false,
                child: Container(
                  // width: scWidth,
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Store name :${profileModel.data?.name ?? ""}",
                    style: TextStyle(
                        color: blackColor,
                        fontSize: lgFontSize,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                height: scHeight / 1.5,
                child: ListView.builder(
                  itemBuilder: (context, i) {
                    return AlertCard(index: i);
                  },
                  itemCount: profileModel.data?.subUsers?.length == 0
                      ? 1
                      : profileModel.data?.subUsers?.length ?? 0,
                  shrinkWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  int index;
  AlertCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StoreName(
                        userId: profileModel.data?.subUsers?.length != 0
                            ? profileModel.data?.subUsers![index].id.toString()
                            : profileModel.data?.id.toString(),
                      )));
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

          // height: scHeight / ,
          decoration: BoxDecoration(
              color: appcolor, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                profileModel.data?.subUsers?.length == 0
                    ? profileModel.data?.name.toString() ?? ''
                    : profileModel.data?.subUsers?[index].name.toString() ?? '',
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
      ),
    );
  }
}
