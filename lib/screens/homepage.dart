import 'package:flutter/material.dart';
import 'package:kaplas_1/model/news.dart' as news;
import 'package:kaplas_1/provider/news_provider.dart';
import 'package:kaplas_1/widgets/custom_bottom_vavbar.dart';
import 'package:kaplas_1/widgets/favs_list.dart';
import 'package:kaplas_1/widgets/news_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  bool isLoading = false;
  PageController pageController;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    pageController = PageController();
    Provider.of<News>(context, listen: false).getNews().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PageView(
                onPageChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
                controller: pageController,
                children: [
                  NewsList(),
                  FavsList(),
                ],
              ),
        bottomNavigationBar: CustomBottomNavBar(
          index: selected,
          ontap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      selected = index;

      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }
}
