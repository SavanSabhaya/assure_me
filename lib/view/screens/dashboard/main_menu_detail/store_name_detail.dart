import 'package:assure_me/constant.dart';
import 'package:assure_me/view/screens/reports/report_send.dart';
import 'package:assure_me/view/screens/reports_detail/genrate_report.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import 'dart:convert';

import 'package:syncfusion_flutter_charts/charts.dart';

class StoreNameDetail extends StatefulWidget {
  static const routeName = '/StoreNameDetail';
  @override
  State<StoreNameDetail> createState() => _StoreNameDetailState();
}

class _StoreNameDetailState extends State<StoreNameDetail> {
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
                // height: scHeight / 1.,
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Device Name",
                            style: TextStyle(
                                color: blackColor,
                                fontSize: lgFontSize,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: appcolor),
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Text(
                                  "13 Nov",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: dfFontSize,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(Icons.keyboard_arrow_down_sharp)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Current temp",
                                  style: TextStyle(
                                      color: drakGreyColor,
                                      fontSize: exSmFontSize,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "25°C",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: drakGreyColor),
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(15),
                            child: GestureDetector(
                              onTap: () {
                                  Navigator.push(
            context, MaterialPageRoute(builder: (context) => GenrateReport()));
                              },
                              child: Text(
                                "Edit Values",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Traget",
                                  style: TextStyle(
                                      color: drakGreyColor,
                                      fontSize: exXSmFontSize,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "25°C",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: smFontSize,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Max",
                                  style: TextStyle(
                                      color: drakGreyColor,
                                      fontSize: exXSmFontSize,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "27°C",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: smFontSize,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Min",
                                  style: TextStyle(
                                      color: drakGreyColor,
                                      fontSize: exXSmFontSize,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "23°C",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: smFontSize,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Graph

                    Container(
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          SplineSeries<ChartData, String>(
                            dataSource: <ChartData>[
                              ChartData('Jan', 10),
                              ChartData('Feb', 20),
                              ChartData('Mar', 15),
                              ChartData('Apr', 25),
                              ChartData('May', 30),
                            ],
                            xValueMapper: (ChartData sales, _) => sales.month,
                            yValueMapper: (ChartData sales, _) => sales.sales,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                                  Navigator.push(
            context, MaterialPageRoute(builder: (context) => ReportSend()));
                              },
                              child: Text(
                                'Genrate Report',
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
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String month;
  final double sales;

  ChartData(this.month, this.sales);
}