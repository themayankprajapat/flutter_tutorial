import 'dart:developer';

import 'package:flutter_tutorial/utils/api_urls.dart';
import 'package:http/http.dart' as http;

class BaseService {
  Future<http.Response> getHttp(String api) async {
    final url = ApiUrls.baseUrl + api;
    log(url, name: 'getHttp');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    // log(response.statusCode.toString(), name: 'status');
    // log(response.body, name: 'body');
    return response;
  }
}
