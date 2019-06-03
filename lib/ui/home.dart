import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _agecontroller = new TextEditingController();
  final TextEditingController _heightcontroller = new TextEditingController();
  final TextEditingController _weightcontroller = new TextEditingController();
  double bmi = 0;
  String _resultReading = "";
  String _finalResult = "";
  void _calculateBmi() {
    setState(() {
      int age = int.parse(_agecontroller.text);
      double height = double.parse(_heightcontroller.text);
      double inches = height * 12;
      double weight = double.parse(_weightcontroller.text);

      if ((_agecontroller.text.isNotEmpty || age > 0) &&
          (_heightcontroller.text.isNotEmpty || height > 0) &&
          (_weightcontroller.text.isNotEmpty || weight > 0))
        bmi = weight / (inches * inches) * 703;

      if (double.parse(bmi.toStringAsFixed(1)) < 18.5) {
        _resultReading = "Underweight";
        print(_resultReading);
      } else if (double.parse(bmi.toStringAsFixed(1)) >= 18.5 && bmi < 25) {
        _resultReading = "Great Shape!"; 
        print(_resultReading);
      } else if (double.parse(bmi.toStringAsFixed(1)) >= 25.0 && bmi < 30) {
        _resultReading = "Overweight";
      } else if (double.parse(bmi.toStringAsFixed(1)) >= 30.0) {
        _resultReading = "Obese";
      } else {
        bmi = 0.0;
      }
      _finalResult = "Your BMI: ${bmi.toStringAsFixed(1)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        backgroundColor: Colors.pinkAccent.shade400,
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              "images/111 bmilogo.png",
              height: 180.0,
              width: 180.0,
            ),
            new Container(
                margin: const EdgeInsets.all(3.0),
                color: Colors.tealAccent,
                height: 180.0,
                width: 300.0,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      keyboardType: TextInputType.number,
                      controller: _agecontroller,
                      decoration: new InputDecoration(
                          hintText: "Age e.g. 20",
                          icon: new Icon(Icons.person_outline)),
                    ),
                    new TextField(
                      keyboardType: TextInputType.number,
                      controller: _heightcontroller,
                      decoration: new InputDecoration(
                          hintText: "Height in feet e.g.5.8",
                          icon: new Icon(Icons.poll)),
                    ),
                    new TextField(
                      keyboardType: TextInputType.number,
                      controller: _weightcontroller,
                      decoration: new InputDecoration(
                          hintText: "Weight in lbs e.g.125",
                          icon: new Icon(Icons.line_weight)),
                    ),
                  ],
                )),
            new Padding(
              padding: new EdgeInsets.all(10.0),
            ),
            new Container(
              alignment: Alignment.center,
              child: new RaisedButton(
                onPressed: _calculateBmi,
                color: Colors.pinkAccent,
                child: new Text(
                  "Calculate",
                  style: new TextStyle(color: Colors.white),
                ),
              ),
            ),
            new Padding(padding: const EdgeInsets.all(5.0)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$_finalResult",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text(
                  "$_resultReading",
                  style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
