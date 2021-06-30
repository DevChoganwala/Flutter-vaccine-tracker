import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Email Registered",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.lightBlue[50],
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
            child: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/tick.png',
                  ),
                  Text(
                      "Successfully registered, emails will be sent to your email id every 12 hours.",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
