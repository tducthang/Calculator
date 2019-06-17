import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: new MyHomePage(
        title: "Calculator ",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  MyHomePage({Key key, this.title}) : super(key: key);
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";

  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if(_output.contains(".")){
        print("AAAAAAAA");
        return;
      }else{
        _output=_output + buttonText;
      }
    }else if(buttonText == "="){
      num2= double.parse(output);

      if(operand=="+"){
        _output=(num1+ num2).toString();
      }
      if(operand=="-"){
        _output=(num1- num2).toString();
      }
      if(operand=="x"){
        _output=(num1 * num2).toString();
      }
      if(operand=="/"){
        _output=(num1 / num2).toString();
      }

      num1=0.0;
      num2=0.0;
      operand="";
    }else{
      _output=_output+ buttonText;
    }

    print(_output);

    setState(() {
      output=double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget builtButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
          padding: new EdgeInsets.all(24.0),
          child: new Text(buttonText,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),),
          onPressed: () =>
              buttonPressed(buttonText)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0
                ),
                child: new Text(output, style: new TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold
                ),)),

            new Expanded(
                child: new Divider()),
            Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    builtButton("7"),
                    builtButton("8"),
                    builtButton("9"),
                    builtButton("/"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    builtButton("4"),
                    builtButton("5"),
                    builtButton("6"),
                    builtButton("x"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    builtButton("1"),
                    builtButton("2"),
                    builtButton("3"),
                    builtButton("-"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    builtButton("."),
                    builtButton("0"),
                    builtButton("00"),
                    builtButton("+"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    builtButton("CLEAR"),
                    builtButton("="),

                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
