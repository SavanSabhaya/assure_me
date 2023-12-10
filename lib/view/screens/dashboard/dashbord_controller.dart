import 'dart:convert';

import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/dashboard/home_page.dart';
import 'package:assure_me/view/screens/dashboard/model/deviceList_model.dart';
import 'package:assure_me/view/screens/dashboard/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

DeviceListModel deviceListModel = DeviceListModel();
NotificationModel notificationModel = NotificationModel();

class DashbordController {
  var preferences = MySharedPref();
  final apiReq = NetworkApiService();

  deviceList({BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.devicelist;

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
            deviceListModel = DeviceListModel.fromJson(value);
          });
          Logger().d('get code==>$value');
          EasyLoading.dismiss().then((value) {});
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
      "device_id": deviceId,
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
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
