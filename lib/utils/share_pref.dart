import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as dio;
import 'package:http/http.dart' as http;


class SharePreData {
  static String keyLoginModel = "login_model";
  static String keySignupModel = "key_SaveSignupModel";
  static String keytoken = "key_SaveToken";
}



// ignore_for_file: file_names




//main methods for api
class NetworkApiService  {
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
    print('API : ' + url.toString());
    try {
      Response? response;
      isHeader != null && isHeader
          ? response = await post(
              Uri.parse(url),
              body: jsonEncode(data),
              headers: {HttpHeaders.contentTypeHeader: "application/json"},
            )
          : response = await post(
              Uri.parse(url),
              body: jsonEncode(data),
            );
      print('returnResponseData ::: ' + returnResponse(response).toString());
      return returnResponse(response);
    } on SocketException {
      // throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future<dynamic> getPostApiTokenResponse({
    required String url,
    dynamic data,
    required String token,
  }) async {
    final Map<String, String> headers = {
      "Authorization": "Bearer $token ",
    };
    print('API : ' + url.toString());
    try {
      Response response = await post(
        headers: headers,
        Uri.parse(url),
        body: data,
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
    print('returnResponse ::: ' + response.statusCode.toString());
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
