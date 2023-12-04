import 'package:assure_me/api_%20service/api_constant.dart';
import 'package:http/http.dart' as http;
/* 
class RemoteServices {
  static var client = http.Client();

  static Future<void> get(String url, Map<String, dynamic>? body) async {
    var response = await client.get(Uri.parse(url),);
    if (response.statusCode == 200) {
      // var jsonString = response.body;
      // return response.body;
    } else {
      //show error message
      return null;
    }
  }
}
 */

import 'dart:convert';

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
