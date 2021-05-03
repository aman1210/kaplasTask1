import 'package:flutter/material.dart';
import 'package:kaplas_1/model/news.dart' as news;
import 'package:kaplas_1/provider/news_provider.dart';
import 'package:kaplas_1/widgets/news_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 'news';
  bool isLoading = false;
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<News>(context, listen: false).getNews().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : NewsList(),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: selected == 'news'
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'News',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: selected != 'news'
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: selected != 'news' ? Colors.white : Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Favs',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
