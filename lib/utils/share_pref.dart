import 'dart:convert';
import 'dart:io';
import 'package:assure_me/utils/prefrence_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class SharePreData {
  static String keyLoginModel = "login_model";
  static String keySignupModel = "key_SaveSignupModel";
  static String keytoken = "key_SaveToken";
}

// ignore_for_file: file_names

//main methods for api
class NetworkApiService {
  var preferences = MySharedPref();
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    print('API : ' + url.toString());
    try {
      final response = await dio.get(Uri.parse(url));
      print('returnResponseData ::: ' + returnResponse(response).toString());
      responseJson = returnResponse(response);
    } on SocketException {
      // throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(
      {required String url, required dynamic data, dynamic isHeader}) async {
    Logger().d('API : ' + url.toString());
    Logger().d('API : ' + data);

    try {
      Response? response;
      isHeader != null && isHeader
          ? response = await post(
              Uri.parse(url),
              body: data,
              headers: {HttpHeaders.contentTypeHeader: "application/json"},
            )
          : response = await post(
              Uri.parse(url),
              body: data,
            );
      Logger()
          .d('returnResponseData ::: ' + returnResponse(response).toString());
      return returnResponse(response);
    } on SocketException {
      // throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future<dynamic> getPostApiTokenResponse({
    required String url,
    dynamic data,
  }) async {
    var gettoken;
    Map<String, String> headers = {};
    preferences.getStringValue(SharePreData.keytoken).then((token) {
      // if (token != null) {
      //   // headers['Authorization'] = token;
      //   print('=====> get token api service $token');
      // }
      headers.addAll({
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "$token",
      });
    });

    // final Map<String, String> headers = {
    //   "Authorization": "Bearer $gettoken ",
    // };
    print('API : ' + url.toString());
    try {
      Response response = await post(
        headers: headers,
        Uri.parse(url),
        body: data == null ? null : data,
      );
      print('returnResponseData ::: ' + returnResponse(response).toString());
      return returnResponse(response);
    } on SocketException {
      // throw FetchDataException('No Internet Connection');
    }
  }

  // Multipart Api call for user profile update
  @override
  Future<dynamic> postMultiPartApi(
      {required String url,
      required Map<String, String> data,
      required File? profileFile}) async {
    final Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    print('API : ' + url.toString());
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(data);
      request.files
          .add(await http.MultipartFile.fromPath('image', profileFile!.path));
      request.headers.addAll(headers);
      Response response = await http.Response.fromStream(await request.send());
      return returnResponse(response);
    } on SocketException {
      // throw FetchDataException('No Internet Connection');
    }
  }

  dynamic returnResponse(dio.Response response) {
    Logger().d('returnResponse ::: ' + response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      /* case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(
            'Oops! Something went wrong on our server. Please try again in a few seconds. If the problem persists, contact our support team at mailto:ielts@engvarta.com for assistance.');
      case 404:
        throw UnauthorisedException(response.body.toString()); */
      default:
        throw EasyLoading.show(indicator: Text("${response.statusCode}"));
      // 'Error accured while communicating with serverwith status code${response.statusCode}');
    }
  }
}
