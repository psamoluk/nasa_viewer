import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final RefreshCallback refreshView;
  final RandomizeDateCallback randomizeDate;
  BottomNavigation(this.refreshView, this.randomizeDate);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        //color: Color.fromRGBO(61, 61, 61, 1.0),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {refreshView();},
            ),
            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {randomizeDate();},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {print('go to settings');},
            ),
          ],
        ),
      );
  }
}
typedef RefreshCallback = void Function();
typedef RandomizeDateCallback = void Function();