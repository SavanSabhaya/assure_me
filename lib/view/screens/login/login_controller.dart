import 'dart:convert';

import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/api_%20service/service.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/dashboard/model/deviceList_model.dart';
import 'package:assure_me/view/screens/login/login_model.dart';
import 'package:assure_me/view/screens/splash/splash.dart';
import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

String tokens = '';


class LoginController {
  LoginModel? loginModel;

  var preferences = MySharedPref();
  final apiReq = NetworkApiService();
  loginApi(
      {required String emailAddress,
      required String password,
      required String token,
      BuildContext? context,
      setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.login;
    Map<String, String> params = {
      'email': emailAddress,
      'password': password,
      'device_token': token
    };
    EasyLoading.show();

    await apiReq
        .getPostApiResponse(url: url, data: jsonEncode(params), isHeader: true)
        .then((value) async {
      try {
        if (value['success'] == true) {
          EasyLoading.dismiss();
          loginModel = LoginModel.fromJson(value);
          tokens = loginModel?.data?.token ?? '';
          bearerToken = loginModel?.data?.token ?? '';
          preferences.setString(
              SharePreData.keytoken, loginModel?.data?.token.toString() ?? '');
          Logger().d(loginModel?.data?.token);
          Navigator.pushNamedAndRemoveUntil (context!, AppRoutes.homepage ,(route) => false,);
        } else {
          EasyLoading.dismiss();
          awesomeTopSnackbar(context!, value['message']);
        }
      } catch (e) {
        print(e);
      }
    });
  }

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
