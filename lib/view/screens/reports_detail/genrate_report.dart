import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/view/screens/dashboard/model/deviceList_model.dart';
import 'package:assure_me/view/screens/profile/profile_controller.dart';
import 'package:assure_me/view/screens/reports/report_send.dart';
import 'package:assure_me/view/screens/reports_detail/mobile.dart';
import 'package:assure_me/view/screens/reports_detail/pdfview.dart';
import 'package:assure_me/view/screens/reports_detail/report_model.dart';
import 'package:assure_me/view/screens/splash/splash.dart';
import 'package:assure_me/view/widgets/custom_calendar.dart';
import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

ReportModel reportModel = ReportModel();

class GenrateReport extends StatefulWidget {
  DatumTemp? data;
  GenrateReport({this.data});
  static const routeName = '/GenrateReport';
  @override
  State<GenrateReport> createState() => _GenrateReportState();
}

class _GenrateReportState extends State<GenrateReport> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _fname = '';
  String _lname = '';
  String _email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print('get dtating date ===>$startingDate');
      startDateController.text = startingDate;
      endDateController.text = endingDate;
      emailController.text = profileModel.data?.email ?? '';
    });
  }

  Future<void> editValuesApi(
      {String? deviceId, String? startDate, String? endDate}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.dateReport;
    final Map<String, dynamic> bodyParams = {
      "start_date": startDate,
      "end_date": endDate,
      "device_id": deviceId
    };

    print('generate report body==$bodyParams');
    EasyLoading.show();
    final http.Response response = await http
        .post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      },
      body: jsonEncode(bodyParams),
    )
        .then((value) {
      setState(() {});
      return value;
    });

    if (response.statusCode == 200) {
      reportModel = ReportModel.fromJson(jsonDecode(response.body));
      print('report successFully===>${response.body}');
      EasyLoading.dismiss();
    } else {
      print('Failed to report. Status code: ${response.statusCode}');
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: scWidth / 4,
                  margin: EdgeInsets.only(top: scHeight / 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                  margin: EdgeInsets.only(
                      bottom: scHeight / 15, top: scHeight / 25),
                  child: Text(
                    "Generate Report",
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Please the from and to dates of information you would like exported",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: smFontSize,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "From:",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: TextFormField(
                                  controller: startDateController,
                                  readOnly: true,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomCalendar(
                                                  isFrom: 'start',
                                                ))).then((value) {
                                      if (value != null) {
                                        setState(() {
                                          startDateController.text = value;
                                        });
                                      }
                                    });
                                  },
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 19.0, color: blackColor),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "25/03/2023",
                                    hintStyle: TextStyle(color: drakGreyColor),
                                    fillColor: lightGrey,
                                    contentPadding: const EdgeInsets.all(16),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                            ],
                          ),
                        ),
                        //////////////////
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To:",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: TextFormField(
                                  controller: endDateController,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomCalendar(
                                                  isFrom: 'end',
                                                ))).then((value) {
                                      if (value != null) {
                                        setState(() {
                                          endDateController.text = value;
                                        });
                                      }
                                    });
                                  },
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 19.0, color: blackColor),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "25/03/2023",
                                    hintStyle: TextStyle(color: drakGreyColor),
                                    fillColor: lightGrey,
                                    contentPadding: const EdgeInsets.all(16),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                            ],
                          ),
                        ),
                        //////////////////
                        Container(
                          margin: EdgeInsets.only(
                            top: 25,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Please enter the email address you would Like the report to be sent to ",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: TextFormField(
                                  controller: emailController,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 19.0, color: blackColor),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "example@example.com",
                                    hintStyle: TextStyle(color: drakGreyColor),
                                    fillColor: lightGrey,
                                    contentPadding: const EdgeInsets.all(16),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                            ],
                          ),
                        ),
                        //////////////////

                        Container(
                          margin: EdgeInsets.only(top: scHeight / 25),
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
                                    if (startDateController.text == "" ||
                                        endDateController.text == '') {
                                      awesomeTopSnackbar(
                                          context, 'Please selcet date');
                                    } else {
                                      editValuesApi(
                                              startDate:
                                                  startDateController.text,
                                              endDate: endDateController.text,
                                              deviceId: widget.data?.deviceId)
                                          .then((value) async {
                                        var getpath;
                                        setState(() async {
                                          var getpath = await generatePDF(
                                              reportModel.data);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PDFViewerPage(
                                                        pdfPath:
                                                            getpath.toString(),
                                                      )));
                                        });
                                      });
                                    }
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
