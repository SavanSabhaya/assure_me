import 'dart:convert';

import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/password/code.dart';
import 'package:assure_me/view/screens/password/model/forgot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

String emailNameForOtp = '';

class PasswordController {
  var preferences = MySharedPref();
  final apiReq = NetworkApiService();
  ForgotModel forgotModel = ForgotModel();
  forgotPasswordApi(
      {required String emailAddress, BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.forgotePassword;

    Map<String, String> params = {
      'email': emailAddress,
    };
    EasyLoading.show();

    await apiReq
        .getPostApiResponse(url: url, data: jsonEncode(params), isHeader: true)
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          Logger().d('gmail is  code==>$emailNameForOtp');
          emailNameForOtp = emailAddress;
          forgotModel = ForgotModel.fromJson(value);
          Logger().d('get code==>$value');
          EasyLoading.dismiss().then((value) {
            Navigator.push(
                context!,
                MaterialPageRoute(
                    builder: (context) => OtpCode(emailForOtp: emailAddress)));
          });
        }
      } catch (e) {
        EasyLoading.dismiss();
        print(e);
      }
    });
  }

  otpVerify(
      {required String emailId,
      required String otpCode,
      BuildContext? context,
      setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.checkOtp;
    Map<String, String> params = {'email': emailId, 'otp': "12345"};
    EasyLoading.show();
    Logger().d('params for code==>$params');

    await apiReq
        .getPostApiResponse(url: url, data: jsonEncode(params), isHeader: true)
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          Logger().d('get code==>$value');
          EasyLoading.dismiss().then((value) {
            Navigator.pushNamed(context!, AppRoutes.newPassword);
          });
        }
      } catch (e) {
        print(e);
      }
    });
  }

  resetPassword(
      {required String password, BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.resetPassword;

    Map<String, String> params = {
      'email': emailNameForOtp,
      'password': password
    };
    EasyLoading.show();

    await apiReq
        .getPostApiResponse(url: url, data: jsonEncode(params), isHeader: true)
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          Logger().d('reset password is ==>$value');
          EasyLoading.dismiss().then((value) {
            Navigator.pushNamed(context!, AppRoutes.login);
          });
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
