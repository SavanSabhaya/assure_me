import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/view/screens/dashboard/dashbord_controller.dart';
import 'package:assure_me/view/screens/dashboard/home_page.dart';
import 'package:assure_me/view/screens/dashboard/model/deviceList_model.dart';
import 'package:assure_me/view/screens/reports/success_value.dart';
import 'package:assure_me/view/screens/splash/splash.dart';
import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';

class EditValues extends StatefulWidget {
  DatumTemp? data;
  EditValues({this.data});
  static const routeName = '/EditValues';
  @override
  State<EditValues> createState() => _EditValuesState();
}

class _EditValuesState extends State<EditValues> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController targetTempController = TextEditingController();
  TextEditingController maxTempController = TextEditingController();
  TextEditingController minTempController = TextEditingController();

  String _fname = '';
  String _lname = '';
  String _email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print('get temp======>>>>${widget.data?.deviceMaxTemperature}');
      // targetTempController;
      maxTempController.text = widget.data?.deviceMaxTemperature ?? '';
      minTempController.text = widget.data?.deviceMinTemperature ?? '';
    });
  }

  Future<void> editValuesApi(
      {String? deviceId,
      String? autorisedId,
      String? maxtemp,
      String? minTemp}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.temperatureUpdate;
    final Map<String, dynamic> bodyParams = {
      "device_id": deviceId,
      "device_max": maxtemp,
      "device_min": minTemp,
      "autorised_person_id": autorisedId,
    };
    EasyLoading.show();
    print('temp edit bodyParams===>${bodyParams}');
    print('temp edit url===>${url}');
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      },
      body: jsonEncode(bodyParams),
    );

    if (response.statusCode == 200) {
      print('temp edit successFully===>${response.body}');
      EasyLoading.dismiss();
      Navigator.pushReplacementNamed(context, AppRoutes.homepage);
    } else {
      print('Failed to update profile. Status code: ${response.statusCode}');
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
        // decoration: BoxDecoration(gradient: applg),
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
                  margin: EdgeInsets.only(
                      bottom: scHeight / 15, top: scHeight / 25),
                  child: Text(
                    "Edit Values",
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
                            top: 00,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   "Traget temperature",
                              //   style: TextStyle(
                              //       color: blackColor,
                              //       fontSize: smFontSize,
                              //       fontWeight: FontWeight.bold),
                              //   textAlign: TextAlign.left,
                              // ),
                              // Text(
                              //   "Enter the traget temperature in *C",
                              //   style: TextStyle(
                              //       color: blackColor,
                              //       fontSize: dfFontSize,
                              //       fontWeight: FontWeight.w400),
                              //   textAlign: TextAlign.left,
                              // ),
                              // Container(
                              //   margin: EdgeInsets.only(top: 8),
                              //   child: TextFormField(
                              //     controller: targetTempController,
                              //     autofocus: false,
                              //     style: TextStyle(
                              //         fontSize: 19.0, color: blackColor),
                              //     decoration: InputDecoration(
                              //       filled: true,
                              //       hintText: "25",
                              //       hintStyle: TextStyle(color: drakGreyColor),
                              //       fillColor: lightGrey,
                              //       contentPadding: const EdgeInsets.all(16),
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide:
                              //             BorderSide(color: Colors.white),
                              //         borderRadius: BorderRadius.circular(5),
                              //       ),
                              //       enabledBorder: UnderlineInputBorder(
                              //         borderSide:
                              //             BorderSide(color: Colors.white),
                              //         borderRadius: BorderRadius.circular(5),
                              //       ),
                              //     ),
                              //     keyboardType: TextInputType.emailAddress,
                              //     validator: (value) {
                              //       if (value!.isEmpty) {
                              //         return 'Please enter your first name';
                              //       }
                              //       return null;
                              //     },
                              //     onChanged: (value) {
                              //       setState(() {
                              //         _fname = value.trim();
                              //       });
                              //     },
                              //   ),
                              // ),
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
                                "Max temperature",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Enter the maximum temperature in *C that if reached you will be notifed",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: TextFormField(
                                  controller: maxTempController,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 19.0, color: blackColor),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "27",
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
                                "Min temperature",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Enter the minimum temperature in *C that if reached you will be notifed",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: TextFormField(
                                  controller: minTempController,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 19.0, color: blackColor),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "23",
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
                                    if (maxTempController.text == '' ||
                                        minTempController.text == '') {
                                      awesomeTopSnackbar(
                                          context, 'please check the detail');
                                    } else {
                                      /* DashbordController().editvalues(
                                          widget.data?.deviceId.toString() ??
                                              '',
                                          maxTempController.text,
                                          minTempController.text,
                                          context: context); */
                                      editValuesApi(
                                          deviceId:
                                              widget.data?.deviceId.toString(),
                                          maxtemp: maxTempController.text,
                                          minTemp: minTempController.text,
                                          autorisedId: widget
                                              .data?.autorisedPerson
                                              .toString());
                                    }
                                  },
                                  child: Text(
                                    'Save Changes',
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
