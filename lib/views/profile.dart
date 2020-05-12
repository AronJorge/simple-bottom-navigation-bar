import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
  
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('profile view')
      ],
    );
  }
}