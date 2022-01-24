import "package:flutter/material.dart";

import "dart:math";

void main() => runApp(MaterialApp(
    title: 'eb bill Calc',
    theme: ThemeData(
      primaryColor: Colors.pink,
      accentColor: Colors.pinkAccent,
    ),
    home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String _ebResult = "";

  final TextEditingController _EnterFinalReading = TextEditingController();

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text("EB Bill"), centerTitle: true, elevation: 0.0),
        body: Center(
            child: Container(
                child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _EnterFinalReading,
                  decoration: InputDecoration(
                      labelText: "Enter Final Reading",
                      fillColor: Colors.yellow),
                  keyboardType: TextInputType.number,
                )),
            Flexible(
                fit: FlexFit.loose,
                child: FlatButton(
                    onPressed: _handleCalculation,
                    child: Text("CALCULATE"),
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 24.0, right: 24.0))),
            ebResultsWidget(_ebResult)
          ],
        ))));
  }

  void _handleCalculation() {
    double sum = 0.0;
    var a;
    var b;
    var c;

    int f = int.parse(_EnterFinalReading.text);

    if (f > 500) {
      a = (f - 500) * 6.6;
      b = 300 * 4.6;
      c = 100 * 3.5;
      sum = a + b + c + 50;
    } else if (f > 200) {
      a = (f - 200) * 3;
      b = 100 * 2;
      sum = a + b + c + 30;
    } else if (f > 100) {
      a = (f - 100) * 1.5;
      sum = a + 20;
    }

    _ebResult = sum.toStringAsFixed(2);

    setState(() {});
  }

  Widget ebResultsWidget(ebResult) {
    bool canShow = false;
    String _ebResult = ebResult;
  
    return Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(children: [
                Text("EB BILL",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Container(
                    child: Text(_ebResult,
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)))
              ]));
  }
}


  
   
