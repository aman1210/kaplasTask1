import 'package:flutter/material.dart';
import 'package:kaplas_1/model/news.dart' as news;
import 'package:kaplas_1/provider/news_provider.dart';
import 'package:kaplas_1/widgets/news_item.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  final animation = Tween(begin: 1, end: 0);
  @override
  Widget build(BuildContext context) {
    List<news.News> allnews = Provider.of<News>(context).allnews;

    return AnimatedList(
      initialItemCount: allnews.length,
      itemBuilder: (context, index, animation) => NewsItem(
        newsitem: allnews[index],
        index: index,
      ),
    );
  }
}
