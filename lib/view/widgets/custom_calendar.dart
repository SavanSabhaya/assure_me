import 'package:assure_me/view/screens/reports_detail/genrate_report.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:table_calendar/table_calendar.dart';

import 'dart:io' show Platform;
import '../../../constant.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

String startingDate = '';
String endingDate = '';
String dropdownDate = '';
String dropdownDateFormat = '';

class CustomCalendar extends StatefulWidget {
  String? isFrom;
  CustomCalendar({this.isFrom});
  static const routeName = '/CustomCalendar';
  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final _formKey = GlobalKey<FormState>();
  bool isSelected = false;

  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      if (widget.isFrom == 'start') {
        startingDate = DateFormat('yyyy-MM-dd').format(day);
      } else if (widget.isFrom == 'dropdown') {
        dropdownDate = DateFormat(isSelected == true ? 'dd-MM-yyyy' : 'dd MMM')
            .format(day);
        // dropdownDate = DateFormat('dd MMM').format(day);
      } else {
        endingDate = DateFormat('yyyy-MM-dd').format(day);
      }
      print('get day====>>>${day}');
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: applg),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Text("Selected Day " + today.toString().split(" ")[0]),
                Container(
                  child: TableCalendar(
                    locale: "en_US",
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: appcolor, // Change this to your desired color
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(5.0),
                      ),
                      todayDecoration: BoxDecoration(
                        color: blackColor, // Change this to your desired color
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    focusedDay: today,
                    firstDay: DateTime.utc(2010, 10, 12),
                    lastDay: DateTime.utc(2030, 10, 10),
                    onDaySelected: _onDaySelected,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(
                        top: 10, bottom: 0, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: appcolor,
                          radius: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                              );
                            },
                            child: Icon(
                              Icons.close,
                              color: dfColor,
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: appcolor,
                          radius: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (widget.isFrom == 'start') {
                                  Navigator.pop(context, startingDate);
                                } else if (widget.isFrom == 'dropdown') {
                                  Navigator.pop(context, dropdownDate);
                                } else {
                                  Navigator.pop(context, endingDate);
                                }
                              });
                            },
                            child: Icon(
                              Icons.check,
                              color: dfColor,
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
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
