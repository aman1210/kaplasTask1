import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kaplas_1/model/news.dart' as news;

class News with ChangeNotifier {
  List<news.News> _news = [];
  List<news.News> _fav = [];

  List<news.News> get allnews {
    return _news;
  }

  Future<void> getNews() async {
    final Uri uri = Uri.parse("https://api.first.org/data/v1/news");
    var response = await http.get(uri);
    var responseData = json.decode(response.body);
    var data = responseData['data'] as List<dynamic>;
    List<news.News> temp = [];
    data.forEach((newsItem) {
      print(newsItem['id']);
      temp.add(
        new news.News(
          id: newsItem['id'],
          summary: newsItem['summary'],
          date: newsItem['published'],
          title: newsItem['title'],
        ),
      );
    });
    _news = temp;
    notifyListeners();
  }
}
