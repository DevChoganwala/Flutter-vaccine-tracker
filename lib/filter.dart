import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './filterbutton.dart';
import './final.dart';
import './data.dart' as dataa;

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    List<String> filters = [
      'Age 18+',
      'Age 45+',
      'Covishield',
      'Covaxin',
      'Sputnik V',
      'Free',
      'Paid',
    ];
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final emailField = TextField(
      onSubmitted: (String s) {
        dataa.email = s;
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: 'Email-id',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final submitButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FinalPage()),
          );
          final response = await http.post(
              new Uri.http('10.0.2.2:5000', '/api'),
              body: json.encode({
                'pincode': dataa.pincode,
                'email': dataa.email,
                'filters': dataa.filters
              }));
        },
        child: Text("Submit and track",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Email and Filters",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.lightBlue[50],
          height: double.infinity,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    emailField,
                    SizedBox(height: 30.0),
                    Wrap(children: <Widget>[
                      ...(filters).map((e) {
                        return Container(
                            margin: const EdgeInsets.all(5.0),
                            child: FilterButton(e));
                      }).toList()
                    ]),
                    SizedBox(height: 30.0),
                    submitButton,
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
