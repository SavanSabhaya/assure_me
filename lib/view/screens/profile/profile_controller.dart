import 'dart:convert';

import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/profile/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

ProfileModel profileModel = ProfileModel();
String globleFCMToken = '';

class ProfileController {
  var preferences = MySharedPref();
  final apiReq = NetworkApiService();

  profile({BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.profile;

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
            profileModel = ProfileModel.fromJson(value);
          });
          Logger().d('get code==>$value');
          EasyLoading.dismiss().then((value) {});
        }
      } catch (e) {
        print(e);
      }
    });
  }

  profileEdit(String name, String email,
      {BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.updateprofileurl;

    EasyLoading.show();
    Map<String, String> data = {"name": name, "email": email};
    await apiReq
        .getPostApiTokenResponse(
      url: url,
      data: jsonEncode(data),
    )
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          setState(() {
            profileModel = ProfileModel.fromJson(value);
          });
          Logger().d('get code==>$value');
          EasyLoading.dismiss().then((value) {
            Navigator.of(context!).pop();
          });
        }
      } catch (e) {
        EasyLoading.dismiss();
        print(e);
      }
    });
  }

  logoutApi({BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.logout;

    EasyLoading.show();

    await apiReq
        .getPostApiTokenResponse(
      url: url,
      data: jsonEncode({}),
    )
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          EasyLoading.dismiss().then((value) async {
            globleFCMToken =
                await preferences.getStringValue(SharePreData.keyFcmToken);
            await preferences.clear();
            preferences.setString(SharePreData.keyFcmToken, globleFCMToken);
            await Navigator.pushNamedAndRemoveUntil(
                context!, AppRoutes.login, (route) => true);
          });
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
