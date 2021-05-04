import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int index;
  final Function ontap;
  CustomBottomNavBar({this.index, this.ontap});
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          navBarItem(context, 0, widget.index, Icons.list, 'News'),
          SizedBox(
            width: 10,
          ),
          navBarItem(context, 1, widget.index, Icons.favorite, 'Favs'),
        ],
      ),
    );
  }

  Expanded navBarItem(BuildContext context, int index, int selected,
      IconData icon, String title) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color:
              index == selected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: InkWell(
          onTap: () {
            widget.ontap(index);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: index == selected
                    ? Colors.white
                    : index == 0
                        ? Colors.black
                        : Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: index == selected ? Colors.white : Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
