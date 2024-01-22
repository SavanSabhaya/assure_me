import 'dart:convert';

import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/dashboard/model/deviceList_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

class SplashContrller {
  final apiReq = NetworkApiService();

  DeviceListModel deviceListModel = DeviceListModel();

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
}
