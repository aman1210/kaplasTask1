import 'package:flutter/material.dart';
import 'package:kaplas_1/model/news.dart' as news;
import 'package:kaplas_1/provider/news_provider.dart';
import 'package:kaplas_1/widgets/news_item.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<news.News> allnews = Provider.of<News>(context).allnews;

    return ListView.builder(
      itemBuilder: (context, index) {
        return NewsItem(
          newsitem: allnews[index],
        );
      },
      itemCount: allnews.length,
    );
  }
}
