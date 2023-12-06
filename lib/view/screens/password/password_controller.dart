import 'dart:convert';

import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

class PasswordController {
  var preferences = MySharedPref();
  final apiReq = NetworkApiService();

  forgotPasswordApi(
      {required String emailAddress, BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.forgotePassword;
    Map<String, String> params = {
      'email': emailAddress,
    };

    await apiReq
        .getPostApiResponse(url: url, data: jsonEncode(params), isHeader: true)
        .then((value) async {
      EasyLoading.show();
      try {
        if (value['status_code'] == 200) {
          Logger().d('');
          EasyLoading.dismiss();
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
