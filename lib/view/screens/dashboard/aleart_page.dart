import 'package:assure_me/constant.dart';
import 'package:assure_me/view/screens/dashboard/dashbord_controller.dart';
import 'package:assure_me/view/screens/dashboard/model/notification_model.dart';
import 'package:assure_me/view/screens/reports_detail/edit_values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import 'package:intl/intl.dart';

import 'dart:convert';

class AlertsPage extends StatefulWidget {
  static const routeName = '/AlertsPage';
  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  final _formKey = GlobalKey<FormState>();
  // String _fname = '';
  // String _lname = '';
  // String _email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DashbordController().notificationList(setState: setState);
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Alerts",
          style: TextStyle(
              color: blackColor,
              fontSize: lgFontSize,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: notificationModel.statusCode == 101
            ? Center(
                child: Text(
                  'No Alerts Found',
                  style: TextStyle(
                      color: blackColor,
                      fontSize: lgFontSize,
                      fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: notificationModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return AlertCard(notificationModel.data![index]);
                },
              ),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  Datum data;
  AlertCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => EditValues()));
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: CircleAvatar(
                    backgroundColor: appcolor,
                    radius: 5,
                  ),
                ),
                Container(
                  width: 2,
                  height: scHeight / 5,
                  color: drakGreyColor,
                ),
              ],
            ),
            Container(
              width: scWidth / 1.2,
              child: Column(
                children: [
                  ListTile(
                    // leading: CircleAvatar(backgroundColor: drakGreyColor),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            data.title ?? '',
                            maxLines: 4,
                            style: TextStyle(
                                color: blackColor,
                                fontSize: dfFontSize,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          DateFormat('HH:mm').format(data.createdAt!),
                          style: TextStyle(
                              color: blackColor,
                              fontSize: exSmFontSize,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    // subtitle: Text(
                    //   "The device (device Name) & (store name) has reached its maximum temperature!",
                    //   style: TextStyle(
                    //       color: drakGreyColor,
                    //       fontSize: exXSmFontSize,
                    //       fontWeight: FontWeight.w600),
                    // ),
                    // trailing: Text(
                    //   "12:31",
                    //   style: TextStyle(
                    //       color: blackColor,
                    //       fontSize: exXSmFontSize,
                    //       fontWeight: FontWeight.w500),
                    // ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: scWidth / 1.3,
                    // height: scHeight / 13,
                    decoration: BoxDecoration(
                        color: appcolor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                data.message.toString(),
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: dfColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Icon(
                              Icons.arrow_outward_rounded,
                              color: dfColor,
                            )
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Device Location",
                        //       style: TextStyle(
                        //           color: dfColor,
                        //           fontSize: exXSmFontSize,
                        //           fontWeight: FontWeight.w700),
                        //     ),
                        //     Text(
                        //       "25°C",
                        //       style: TextStyle(
                        //           color: dfColor,
                        //           fontSize: exSmFontSize,
                        //           fontWeight: FontWeight.w700),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
