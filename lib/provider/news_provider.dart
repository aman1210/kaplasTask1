import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kaplas_1/model/news.dart' as news;

class News with ChangeNotifier {
  List<news.News> _news = [];
  List<news.News> _fav = [];

  Future<void> getNews() async {
    final Uri uri = Uri(host: 'api.first.org', path: 'data/v1/news');
    var response = await http.get(uri);
    print(response.body);
  }
}
