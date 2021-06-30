import 'package:flutter/material.dart';

import './data.dart' as dataa;

class FilterButton extends StatefulWidget {
  final String text;
  FilterButton(this.text);
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  void selectHandler() {
    setState(() {
      dataa.filters[widget.text] = !dataa.filters[widget.text];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: dataa.filters[widget.text] ? Colors.blue : Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
      onPressed: selectHandler,
      child: Text(widget.text,
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: dataa.filters[widget.text] ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold)),
    );
  }
}
