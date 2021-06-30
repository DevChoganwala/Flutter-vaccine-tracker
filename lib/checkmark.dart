import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CheckMark extends StatefulWidget {
  @override
  _CheckMarkState createState() => _CheckMarkState();
}

class _CheckMarkState extends State<CheckMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.scale(
        scale: 0.1,
        child: Container(
          // height: 100,
          // width: 100,
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          child: Image.asset(
            'images/tick.png',
          ),
        ),
      ),
    );
  }
}
