import 'package:flutter/material.dart';

import './homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vaccine Tracker',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: HomePage(title: 'Vaccine Tracker'),
    );
  }
}
