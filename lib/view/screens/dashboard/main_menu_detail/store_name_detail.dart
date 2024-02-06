import 'package:assure_me/constant.dart';
import 'package:assure_me/view/screens/dashboard/dashbord_controller.dart';
import 'package:assure_me/view/screens/dashboard/model/deviceList_model.dart';
import 'package:assure_me/view/screens/profile/profile_controller.dart';
import 'package:assure_me/view/screens/reports/report_send.dart';
import 'package:assure_me/view/screens/reports_detail/edit_values.dart';
import 'package:assure_me/view/screens/reports_detail/genrate_report.dart';
import 'package:assure_me/view/widgets/custom_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

List<ChartData> chartData = [];

class StoreNameDetail extends StatefulWidget {
  DatumTemp? data;
  StoreNameDetail({this.data});
  static const routeName = '/StoreNameDetail';
  @override
  State<StoreNameDetail> createState() => _StoreNameDetailState();
}

class _StoreNameDetailState extends State<StoreNameDetail> {
  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    chartData.clear();
    print("=====> get id${widget.data?.deviceId}");
    print("=====> get dropdownDate===${dropdownDate}");
    var todayDate;
    setState(() {
      var todayDate = DateFormat('yyyy-MM-dd').format(today);

      DashbordController().chartDataApi(widget.data?.deviceId,
          dropdownDate == null || dropdownDate == '' ? todayDate : dropdownDate,
          setState: setState);
    });
  }

  // String _fname = '';
  // String _lname = '';
  // String _email = '';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chartData.clear();
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
          child: SingleChildScrollView(
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
                        profileModel.data?.name ?? '',
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
                              profileModel.data?.name ?? '',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: lgFontSize,
                                  fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CustomCalendar(
                                                isFrom: 'dropdown',
                                              ))).then((value) {
                                    setState(() {
                                      chartData.clear();
                                      dropdownDate = value;

                                      var todayDate = DateFormat('yyyy-MM-dd')
                                          .format(today);
                                      DashbordController().chartDataApi(
                                          widget.data?.deviceId,
                                          dropdownDate == ''
                                              ? todayDate
                                              : dropdownDate,
                                          setState: setState);
                                      print("dropdownDate===${dropdownDate}");
                                    });
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: appcolor),
                                    borderRadius: BorderRadius.circular(30)),
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Text(
                                      dropdownDate == ''
                                          ? "Select Date"
                                          : dropdownDate,
                                      style: TextStyle(
                                          color: blackColor,
                                          fontSize: dfFontSize,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(Icons.keyboard_arrow_down_sharp)
                                  ],
                                ),
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
                                    "${widget.data?.device?.temperature ?? ''}°C",
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
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditValues(data: widget.data)));
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
                            // Container(
                            //   margin: EdgeInsets.only(left: 15),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         "Traget",
                            //         style: TextStyle(
                            //             color: drakGreyColor,
                            //             fontSize: exXSmFontSize,
                            //             fontWeight: FontWeight.w500),
                            //       ),
                            //       Text(
                            //         "25°C",
                            //         style: TextStyle(
                            //             color: blackColor,
                            //             fontSize: smFontSize,
                            //             fontWeight: FontWeight.w500),
                            //       ),
                            //     ],
                            //   ),
                            // ),
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
                                    "${widget.data?.deviceMaxTemperature}°C",
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
                                    "${widget.data?.deviceMinTemperature}°C",
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
                          primaryXAxis: CategoryAxis(
                              labelStyle: TextStyle(color: Colors.black)),
                          series: <ChartSeries>[
                            SplineSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData sales, _) => sales.month,
                              yValueMapper: (ChartData sales, _) => sales.sales,
                            ),
                          ],
                        ),
                      ),

                      // Container(
                      //   child: SfCartesianChart(
                      //     primaryXAxis: CategoryAxis(),
                      //     series: <ChartSeries>[
                      //       SplineSeries<ChartData, String>(
                      //         dataSource: <ChartData>[
                      //           ChartData('1', 10),
                      //           ChartData('2', 20),
                      //           ChartData('3', 15),
                      //           ChartData('4', 25),
                      //           ChartData('5', 30),
                      //         ],
                      //         xValueMapper: (ChartData sales, _) => sales.month,
                      //         yValueMapper: (ChartData sales, _) => sales.sales,
                      //       ),
                      //     ],
                      //   ),
                      // ),

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
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GenrateReport(
                                                data: widget.data,
                                              )));
                                  setState(() {
                                    startingDate = '';
                                    endingDate = '';
                                  });
                                },
                                child: Text(
                                  'Generate Report',
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
      ),
    );
  }
}

class ChartData {
  final String month;
  final double sales;

  ChartData(this.month, this.sales);
}
