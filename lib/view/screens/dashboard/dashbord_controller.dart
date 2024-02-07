import 'dart:convert';

import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/dashboard/home_page.dart';
import 'package:assure_me/view/screens/dashboard/main_menu_detail/store_name_detail.dart';
import 'package:assure_me/view/screens/dashboard/model/chartmodel.dart';
import 'package:assure_me/view/screens/dashboard/model/deviceList_model.dart';
import 'package:assure_me/view/screens/dashboard/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';

DeviceListModel deviceListModel = DeviceListModel();
NotificationModel notificationModel = NotificationModel();
ChartDataModel chartDataModel = ChartDataModel();

class DashbordController {
  var preferences = MySharedPref();
  final apiReq = NetworkApiService();

  deviceList({String? personId, BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.devicelist;

    EasyLoading.show();
    Map<String, dynamic> params = {"autorised_person_id": personId};

    await apiReq
        .getPostApiTokenResponse(
      url: url,
      data: jsonEncode(params),
    )
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          setState(() {
            deviceListModel = DeviceListModel.fromJson(value);
          });
          Logger().d('get code==>$value');
          Logger().d('get code body==>$params');
          EasyLoading.dismiss().then((value) {});
        } else if (value['status_code'] == 101) {
          setState(() {
            deviceListModel = DeviceListModel.fromJson(value);
          });
          EasyLoading.dismiss();
        }
      } catch (e) {
        print(e);
      }
    });
  }

  editvalues(String deviceId, String maxtemp, String minTemp,
      {BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.temperatureUpdate;

    EasyLoading.show();
    Map<dynamic, dynamic> data = {
      "autorised_person_id": deviceId,
      "device_max": maxtemp,
      "device_min": minTemp
    };

    await apiReq
        .getPostApiTokenResponse(
      url: url,
      data: jsonEncode(data),
    )
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          setState(() {
            deviceListModel = DeviceListModel.fromJson(value);
          });
          Logger().d('get code==>$value');
          Navigator.push(
              context!, MaterialPageRoute(builder: (context) => HomePage()));
          EasyLoading.dismiss().then((value) {});
        } else {
          EasyLoading.dismiss();
          Logger().d('get code==>$value');
        }
      } catch (e) {
        print(e);
        EasyLoading.dismiss();
      }
    });
  }

  notificationList({BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.notification;

    EasyLoading.show();

    await apiReq
        .getPostApiTokenResponse(
      url: url,
      data: jsonEncode({}),
    )
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          setState(() {
            notificationModel = NotificationModel.fromJson(value);
          });
          Logger().d('get code==>$value');
          EasyLoading.dismiss().then((value) {});
        } else {
          setState(() {
            notificationModel = NotificationModel.fromJson(value);
          });
          EasyLoading.dismiss().then((value) {});
        }
      } catch (e) {
        print(e);
      }
    });
  }

  chartDataApi(String? deviceId, String date,
      {BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.chartReport;

    EasyLoading.show();
    Map<dynamic, dynamic> data = {
      "device_id": deviceId,
      "search_date": date,
    };
    print('date param ===>$data');

    await apiReq
        .getPostApiTokenResponse(
      url: url,
      data: jsonEncode(data),
    )
        .then((value) async {
      try {
        Logger().d('get code==>123');

        if (value['status'] == 200) {
          Logger().d('get code==>456');

          setState(() {
            chartDataModel = ChartDataModel.fromJson(value);
            print('get code==>chart data $value');
            for (int i = 0; i < chartDataModel.temperatureList!.length; i++) {
              chartData.add(ChartData(
                  DateFormat('HH:mm').format(chartDataModel.createdAtList![i]),
                  double.parse(chartDataModel.temperatureList![i].toString())));
            }
          });

          // Navigator.push(
          //     context!, MaterialPageRoute(builder: (context) => HomePage()));
          EasyLoading.dismiss().then((value) {});
        } else {
          EasyLoading.dismiss();
          Logger().d('get code==>$value');
        }
      } catch (e) {
        print(e);
        EasyLoading.dismiss();
      }
    });
  }
}
