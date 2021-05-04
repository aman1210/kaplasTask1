import 'package:flutter/material.dart';
import 'package:kaplas_1/model/news.dart' as news;
import 'package:kaplas_1/provider/news_provider.dart';
import 'package:provider/provider.dart';

class NewsItem extends StatelessWidget {
  NewsItem({
    Key key,
    @required this.newsitem,
    @required this.index,
    this.isFav = false,
  }) : super(key: key);

  final news.News newsitem;
  final int index;
  final bool isFav;

  final animation = Tween(begin: 1, end: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  height: 60,
                  child: IconButton(
                    onPressed: () {
                      Provider.of<News>(context, listen: false)
                          .toggleFav(newsitem.id);
                      AnimatedList.of(context).removeItem(
                        index,
                        (context, animation) => SizeTransition(
                          sizeFactor: animation,
                          child: NewsItem(
                            newsitem: newsitem,
                            index: index,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_outline_rounded,
                      size: 50,
                      color: isFav ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsitem.title ?? "",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      newsitem.summary ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      newsitem.date ?? "",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
