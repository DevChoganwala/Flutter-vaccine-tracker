import 'package:flutter/material.dart';

import './filter.dart';
import './data.dart' as dataa;

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final pinField = TextField(
      onSubmitted: (String str) {
        dataa.pincode = str;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FilterPage()),
        );
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: 'pincode',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final detectButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilterPage()),
          );
        },
        child: Text("Detect Location",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.lightBlue[50],
          height: double.infinity,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Covid-19 Vaccine tracker',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 25.0),
                    ),
                    SizedBox(height: 50.0),
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "images/vaccinate.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    pinField,
                    SizedBox(height: 45.0),
                    detectButton,
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
