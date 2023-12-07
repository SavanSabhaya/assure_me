import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/profile/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

String emailNameForOtp = '';

class ProfileController {
  var preferences = MySharedPref();
  final apiReq = NetworkApiService();
  ProfileModel profileModel = ProfileModel();

  profile({BuildContext? context}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.profile;

    EasyLoading.show();

    await apiReq
        .getPostApiTokenResponse(
      url: url,
      data: null,
    )
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          Logger().d('gmail is  code==>$emailNameForOtp');
          // profileModel = ProfileModel.fromJson(value);
          Logger().d('get code==>$value');
          EasyLoading.dismiss().then((value) {
            // Navigator.pushNamed(context!, AppRoutes.otpCode);
          });
        }
      } catch (e) {
        print(e);
      }
    });
  }

/* 
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
  } */
}
