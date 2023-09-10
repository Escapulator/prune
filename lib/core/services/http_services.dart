import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String _baseUrl;

  HttpService(this._baseUrl);
  String get baseUrl => _baseUrl;

  Future<http.Response> post(
    String path,
    Map<dynamic, dynamic> body,
  ) async {
    final String url = baseUrl + path;
    debugPrint('URL:: $url, body:: ${json.encode(body)}');
    final response = await http
        .post(Uri.parse(url), body: json.encode(body))
        .timeout(const Duration(seconds: 40));
    return response;
  }
}
