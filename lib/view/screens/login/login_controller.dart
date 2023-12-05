import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:assure_me/api_%20service/service.dart';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:assure_me/utils/share_pref.dart';
import 'package:assure_me/view/screens/login/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

class LoginController {
LoginModel? loginModel;

 loginApi({required String emailAddress,required String password,BuildContext? context, setState}) async {
 
  var preferences = MySharedPref();
  final apiReq = NetworkApiService();
  String url =ApiConstant.BASE_URL+ApiConstant.login;
  Map<String,dynamic> params = {
    'email': emailAddress,
    'password': password,
  };

  await apiReq.getPostApiResponse(url:url ,data: params,isHeader: true).then((value) async {
      EasyLoading.show();
    try {
      if (value['status_code'] == 200) {
        setState((){
        loginModel=LoginModel.fromJson(value);
          Logger().d(loginModel);
           EasyLoading.dismiss();
        });
       
      } else {
       
      }
    } catch (e) {
     
      print(e);
    }
  });
}

  
}