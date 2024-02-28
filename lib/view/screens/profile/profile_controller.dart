import 'dart:convert';

import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/constant.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/dashboard/model/deviceList_model.dart';
import 'package:assure_me/view/screens/profile/model/offline_notification_model.dart';
import 'package:assure_me/view/screens/profile/model/profile_model.dart';
import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
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
        } else if (value['status_code'] == 403) {
          EasyLoading.dismiss().then((value) {});
          /*   Navigator.pushNamedAndRemoveUntil(
                      context!, AppRoutes.login, (route) => false);
                  setState(() {
                    preferences.clear();
                  }); */
          showDialog(
            barrierDismissible: false,
            context: context!,
            builder: (BuildContext context) {
              return TokenExpiredDialog(
                onRedirectToLogin: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.login, (route) => false);
                  setState(() {
                    preferences.clear();
                  });
                },
              );
            },
          );
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
                context!, AppRoutes.login, (route) => false);
          });
        }
      } catch (e) {
        print(e);
      }
    });
  }

  DeviceListModel deviceListModel = DeviceListModel();

  deviceList({BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.deviceList12;

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
            print('get data 1===>');

            for (var i = 0; i < deviceListModel.data!.length; i++) {
              print('get data 3===>');

              var deviceData = deviceListModel.data![i].device!;
              var deviceName = deviceListModel.data![i].deviceName;
              var minTemp = double.parse(
                  deviceListModel.data![i].deviceMinTemperature.toString());
              var maxTemp = double.parse(
                  deviceListModel.data![i].deviceMaxTemperature.toString());
              var currentTemp = double.parse(deviceData.temperature.toString());

              if (deviceListModel.data![i].status == 0 ||
                  currentTemp < minTemp ||
                  currentTemp > maxTemp) {
                print('get data 4===>');

                showDialog(
                  context: context!,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Alert"),
                      content: Text(
                        deviceListModel.data![i].status == 0
                            ? "The $deviceName is offline at the moment."
                            : currentTemp < minTemp
                                ? 'The $deviceName minimum temperature is low.'
                                : 'The $deviceName maximum temperature is high.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            String message = '';
                            setState(() {
                              if (deviceListModel.data![i].status == 0) {
                                message =
                                    'The $deviceName ${profileModel.data?.name} Acknowledgement';
                              } else if (currentTemp < minTemp) {
                                message =
                                    'The $deviceName minimum temperature is low. ${profileModel.data?.name.toString()} Acknowledgement';
                              } else if (currentTemp > maxTemp) {
                                message =
                                    'The $deviceName maximum temperature is high. ${profileModel.data?.name.toString()} Acknowledgement';
                              }

                              offlineNotificationApi(
                                  deviceListModel.data![i].deviceId ?? '',
                                  message,
                                  context: context,
                                  setState: setState);
                            });
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              }
            }
          });
          Logger().d('get code==>$value');
          EasyLoading.dismiss().then((value) {});
        }
      } catch (e) {
        print(e);
      }
    });
  }

  OfflineNotification offlineNotification = OfflineNotification();
  offlineNotificationApi(String deviceId, String sendMessage,
      {BuildContext? context, setState}) async {
    String url = ApiConstant.BASE_URL + ApiConstant.offlineNotification;

    EasyLoading.show();
    Map<String, String> data = {"device_id": deviceId, "message": sendMessage};
    await apiReq
        .getPostApiTokenResponse(
      url: url,
      data: jsonEncode(data),
    )
        .then((value) async {
      try {
        if (value['status_code'] == 200) {
          print('alert message get OK===>');
          setState(() {
            offlineNotification = OfflineNotification.fromJson(value);
          });
          Logger().d('get code==>$value');
          EasyLoading.dismiss().then((value) {
            Navigator.of(context!).pop();
          });
        } else if (value['status_code'] == 500) {
          awesomeTopSnackbar(context!, 'Somting went wrong!');
        }
      } catch (e) {
        EasyLoading.dismiss();
        print(e);
      }
    });
  }
}
