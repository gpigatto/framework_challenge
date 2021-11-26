import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpClient {
  static Future<Map<String, dynamic>> getListAsync(String path,
      {required Map<String, String> headers}) async {
    var _client = http.Client();

    var myUri = Uri.parse(path);

    headers[HttpHeaders.contentTypeHeader] = "application/json";
    headers[HttpHeaders.acceptHeader] = "application/json";

    try {
      final response = await _client.get(myUri, headers: headers).timeout(
            const Duration(seconds: 20),
          );

      var list = _getResult(
        response: response,
        path: path,
      );

      Map<String, dynamic> json = {
        'ObjectList': list,
      };

      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getAsync(String path,
      {required Map<String, String> headers}) async {
    var _client = http.Client();

    var myUri = Uri.parse(path);

    headers[HttpHeaders.contentTypeHeader] = "application/json";
    headers[HttpHeaders.acceptHeader] = "application/json";

    try {
      final response = await _client.get(myUri, headers: headers).timeout(
            const Duration(seconds: 20),
          );

      return _getResult(
        response: response,
        path: path,
      );
    } catch (e) {
      rethrow;
    }
  }

  static _getResult({required response, path}) {
    // ignore: avoid_print
    print("url: $path status: ${response.statusCode}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // ignore: avoid_print
      print(data);

      return data;
    } else {
      throw ("fetch_error url: $path status: ${response.statusCode}");
    }
  }
}
