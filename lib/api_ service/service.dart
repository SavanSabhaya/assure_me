import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import 'dart:convert';

import 'package:logger/logger.dart';
/* 
class ApiHelper {
  // late String? baseUrl;

  // ApiHelper({this.baseUrl});

  Future<dynamic> getData(String endpoint) async {
    final response = await http.get(Uri.parse(ApiConstant.baseUrl + endpoint));

    return _handleResponse(response);
  }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(ApiConstant.baseUrl + endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw ApiException(response.statusCode, _getErrorDetails(response));
    }
  }

  String _getErrorDetails(http.Response response) {
    try {
      final Map<String, dynamic> errorJson = json.decode(response.body);
      return errorJson['message'] ?? 'Unknown error';
    } catch (e) {
      return 'Unknown error';
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() {
    return 'ApiException - Status Code: $statusCode, Message: $message';
  }
}

 */
class Request {
 
  
/*   Future postAPIWithMediaBearer(context, url, body, strImg, imageParam,
      [profile,
      crn,
      freelancer,
      vat,
      image1,
      image2,
      image3,
      image4,
      image5,
      image6,
      shopSign,
      storeLogo,
      isFrom,
      returnPolicy,
      refundPolicy //maroof,
      ]) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json', //application/json
      'Authorization': "Bearer $userToken", //bearer$userToken
    };

    // print('ItemPictures is '+itemPictures.toString());
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );

    try {
      if (body != null) request.fields.addAll(body);

      if (isFrom == 'store') {
        if (shopSign != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'shop_sign_file',
              shopSign.toString(),
            ),
          );
        }

        if (storeLogo != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'store_logo_file',
              storeLogo.toString(),
            ),
          );
        }

        // if (returnPolicy != null) {
        //   request.files.add(
        //     await http.MultipartFile.fromPath(
        //       'return_policy',
        //       returnPolicy.toString(),
        //     ),
        //   );
        // }

        // if (refundPolicy != null) {
        //   request.files.add(
        //     await http.MultipartFile.fromPath(
        //       'refund_policy',
        //       refundPolicy.toString(),
        //     ),
        //   );
        // }
      } else {
        if (profile == null && crn == null) {
          if (image1 == null) {
            if (strImg.isNotEmpty) {
              request.files.add(await http.MultipartFile.fromPath(
                  imageParam, strImg.toString()));
            }
          } else {
            if (image1 != '') {
              request.files.add(await http.MultipartFile.fromPath(
                'item_picture1',
                image1.path, //toString()
              )); //fromPath
            }
            if (image2 != '') {
              request.files.add(await http.MultipartFile.fromPath(
                  'item_picture2', image2.toString()));
            }
            if (image3 != '') {
              request.files.add(await http.MultipartFile.fromPath(
                  'item_picture3', image3.toString()));
            }
            if (image4 != '') {
              request.files.add(await http.MultipartFile.fromPath(
                  'item_picture4', image4.toString()));
            }
            if (image5 != '') {
              request.files.add(await http.MultipartFile.fromPath(
                  'item_picture5', image5.toString()));
            }
            if (image6 != '') {
              request.files.add(await http.MultipartFile.fromPath(
                  'item_picture6', image6.toString()));
            }
          }
        } else {
          if (profile != '') {
            request.files.add(await http.MultipartFile.fromPath(
                'profile_picture', profile.toString()));
          }
          if (crn != '') {
            request.files.add(
                await http.MultipartFile.fromPath('upload_cr', crn.toString()));
          }
          if (freelancer != '') {
            request.files.add(await http.MultipartFile.fromPath(
                'upload_freelancer_licence', freelancer.toString()));
          }

          // if (maroof != '') {
          //   request.files.add(await http.MultipartFile.fromPath(
          //       'upload_maroof', maroof.toString()));
          // }
          if (vat != '') {
            request.files.add(await http.MultipartFile.fromPath(
              'upload_vat_number_Certificate',
              vat.toString(),
            ));
          }
        }
      }

      request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      Map<String, dynamic>? reponseJson;
      if (response.statusCode == 200) {
        await response.stream.bytesToString().then((value) async {
          String strData = value;
          reponseJson = json.decode(strData);
          if (reponseJson!['status_code'] == 200) {
            return reponseJson;
          } else if (reponseJson!['status_code'] == 500) {
            await TokenUpdateRequest().updateToken();
            postAPIWithMediaBearer(context, url, body, strImg, imageParam, [
              profile,
              crn,
              vat,
              image1,
              image2,
              image3,
              image4,
              image5,
              image6,
              shopSign,
              storeLogo,
              isFrom,
            ]); //maroof,
          } else {
            return reponseJson;
          }
        });
      }
      return reponseJson;
    } catch (e) {
      isLoading = false;
      print(e.toString());
    }
  }
 */
 
 
  /* Future postAPI({context, url, map, token}) async {
    http.Response response;
    var authToken ='Bearer $token';
    Logger().e("POST API AUTHTOKE::::${authToken}");
    Logger().f("POST API url::::${url}");
    if (map != null) {
      var body = json.encode(map);
      Logger().f("POST API body::::${body}");
      print('AuthToken ' + authToken);
      
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'authorization': authToken,
      };
      response = await http.post(
        Uri.parse(ApiConstant.BASE_URL+url),
        headers: headers,
        body: body,
      );
    } else {
      response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/x-www-form-urlencoded',
          'authorization': authToken,
        },
      );
    }

    try {
      if (response.statusCode == 200) {
        String strData = response.body;
        var reponseJson = json.decode(strData);
        Logger().t(reponseJson);
        if (reponseJson!['status_code'] == 200) {
          Logger().t(reponseJson!['status_code']);
          return reponseJson;
        }  else {
          return reponseJson;
        }
      } else {
        return response;
      }
    } catch (e, t) {
      print(e.toString());
      Logger().e("TRACE :::: ${e}");
      Logger().e("TRACE :::: ${t}");
    }
  }
 */
 
 
 
  Future<Map<String, dynamic>?> callGetApi(String endPoint, Function? onError) async {
    var token = '';
    Map<String, String> header = <String, String>{};
    header.addAll({
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET,POST',
      'Access-Control-Allow-Headers': 'X-Requested-With'
    });
    if (token != null) {
      header.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    Logger().i("ApiService GET Api: ${ApiConstant.BASE_URL + endPoint}");
    Logger().i("ApiService Api Header: $header");

    var response = await http.get(Uri.parse(ApiConstant.BASE_URL + endPoint), headers: header);

    Logger().i("ApiService GET Response Code : ${response.statusCode} of ${endPoint}");
    Logger().i("ApiService GET Response : ${json.decode(response.body)}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else
     if (response.statusCode == 404) {
      //TODO : Expired Login
      Logger().i("ApiService Post Response Code : ${response.statusCode}");
      if (onError != null) {
        onError();
      } else {
        Logger().i("logout dialog call  ==>>2");
      }
      return null;
    }
  }

   Future<Map<String, dynamic>?> callPostApi(String endPoint, Object params) async {
    var token = '';
    Map<String, String> header = <String, String>{};
    header.addAll({
      'Accept': 'application/json',
     
      });
   
    Logger().i("ApiService Post Api: ${ApiConstant.BASE_URL + endPoint}");
    Logger().i("ApiService Api Header: $header");
    Logger().i("ApiService Api Params: $params");

    var response = await http.post(Uri.parse(ApiConstant.BASE_URL + endPoint),headers: header, body: params);

    Logger().i("ApiService Post Response Code : ${response.statusCode}");
    Logger().i("ApiService Post Response : ${json.decode(response.body)}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode ==500 ) {
      Logger().i("ApiService Post Response Code : ${response.statusCode}");
      return null;
    } 
  }
}