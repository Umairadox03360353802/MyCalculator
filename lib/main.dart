import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "calculator",
      home: Myhouse(),
    );
  }
}

class Myhouse extends StatefulWidget {
  @override
  _MyhouseState createState() => _MyhouseState();
}

class _MyhouseState extends State<Myhouse> {
  int? firstnum;
  int? sectnum;
  String? textdisplay = "";
  String? res;
  String? operationperform;

  void btnclicked(String btnval) {
    if (btnval == "C") {
      textdisplay = "";
      firstnum = 0;
      sectnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(textdisplay!);
      // res = "";
      operationperform = btnval;
    } else if (btnval == "=") {
      sectnum = int.parse(textdisplay!);
      if (operationperform == "+") {
        res = (firstnum! + sectnum!).toString();
      }
      if (operationperform == "-") {
        res = (firstnum! - sectnum!).toString();
      }
      if (operationperform == "x") {
        res = (firstnum! * sectnum!).toString();
      }
      if (operationperform == "/") {
        res = (firstnum! ~/ sectnum!).toString();
      }
    } else {
      res = int.parse(textdisplay! + btnval).toString();
    }
    setState(() {
      textdisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
        child: OutlinedButton(
      onPressed: () => btnclicked(btnval),
      child: Text("$btnval"),
      style: OutlinedButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Colors.blue,
          padding: EdgeInsets.all(25)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(27),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$textdisplay",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Row(
              children: [
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-")
              ],
            ),
            Row(
              children: [
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x")
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
