import 'package:flutter/material.dart';
import 'package:kaplas_1/provider/news_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<News>(context, listen: false).getNews();
    return Scaffold(
      body: Center(
        child: Text('This is home page'),
      ),
    );
  }
}
