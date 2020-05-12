import 'package:flutter/material.dart';
import 'package:navigationBar/views/home.dart';
import 'package:navigationBar/views/notifications.dart';
import 'package:navigationBar/views/profile.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  var bottomNavigationTitles = [
    ['Home', Icon(Icons.home)],
    ['Notifications', Icon(Icons.notifications)],
    ['Profile', Icon(Icons.person)]
  ];

  int _position = 0;

  void _onItemTapped(int index) {
    setState(() {
      _position = index;
    });

    _controller.jumpToPage(index);
  }

  final _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bottomNavigationTitles[_position][0])),
      body: PageView(
        controller: _controller,
        children: <Widget>[Home(), Notifications(), Profile()],
        onPageChanged: (int page) {
          setState(() {
            _position = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (final tab in bottomNavigationTitles)
            BottomNavigationBarItem(
              icon: tab[1],
              title: Text(tab[0]),
            )
        ],
        currentIndex: _position,
        onTap: _onItemTapped,
      ),
    );
  }
}
