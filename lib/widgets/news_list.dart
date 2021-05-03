import 'package:flutter/material.dart';
import 'package:kaplas_1/model/news.dart' as news;
import 'package:kaplas_1/provider/news_provider.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<news.News> allnews = Provider.of<News>(context).allnews;
    print(allnews.length);
    return ListView.builder(
      itemBuilder: (context, index) {
        print(index);
        return Card(
          child: ListTile(
            title: Text(allnews[index].title),
            subtitle: Text(
              allnews[index].summary ?? '',
              maxLines: 2,
            ),
          ),
        );
      },
      itemCount: allnews.length,
    );
  }
}