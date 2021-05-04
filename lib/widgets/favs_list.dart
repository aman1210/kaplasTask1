import 'package:flutter/material.dart';
import 'package:kaplas_1/model/news.dart' as news;
import 'package:kaplas_1/provider/news_provider.dart';
import 'package:kaplas_1/widgets/news_item.dart';
import 'package:provider/provider.dart';

class FavsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<news.News> fav = Provider.of<News>(context).favnews;
    return fav.length == 0
        ? Center(
            child: Text(
              'No Favorites Added Yet!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          )
        : AnimatedList(
            initialItemCount: fav.length,
            itemBuilder: (context, index, animation) => NewsItem(
              newsitem: fav[index],
              index: index,
              isFav: true,
            ),
          );
  }
}
