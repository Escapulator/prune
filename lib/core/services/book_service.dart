import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ta/core/services/base_url.dart';

import '../model/books_model.dart';

class BookService extends ChangeNotifier {
  late final List<Books> _booksResponse = [];
  List<Books> get bookResponse => _booksResponse;

  Future<List<Books>> getBook(int pageNo) async {
    try {
      final result = await http.post("api/books", {'page': pageNo});
      final Map<String, dynamic> responseBody = json.decode(result.body);
      if (result.statusCode == 200) {
        final resultData = List<Books>.from(
            responseBody['books'].map((item) => Books.fromJson(item)));
        _booksResponse.addAll(resultData);
        notifyListeners();
        return _booksResponse;
      } else {
        return _booksResponse;
      }
    } catch (e) {
      return _booksResponse;
    }
  }
}
