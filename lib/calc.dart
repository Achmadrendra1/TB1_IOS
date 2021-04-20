import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  final textFieldOne = TextEditingController();
  final textFieldTwo = TextEditingController();

  double result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Text(
                "Calculator",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: new InputDecoration(
                    labelText: "Angka Pertama",
                    hintText: "Masukkan Angka Pertama",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                controller: textFieldOne,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: new InputDecoration(
                    labelText: "Angka Kedua",
                    hintText: "Masukkan Angka Kedua",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                controller: textFieldTwo,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 50,
                    alignment: Alignment.center,
                    child: RaisedButton(
                      child: Text('+',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      color: Colors.blue,
                      onPressed: () => calculate('+'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 50,
                    alignment: Alignment.center,
                    child: RaisedButton(
                      child: Text('-',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      color: Colors.blue,
                      onPressed: () => calculate('-'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 50,
                    alignment: Alignment.center,
                    child: RaisedButton(
                      child: Text('x',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      color: Colors.blue,
                      onPressed: () => calculate('*'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 50,
                    alignment: Alignment.center,
                    child: RaisedButton(
                      child: Text('/',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      color: Colors.blue,
                      onPressed: () => calculate('/'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                '${result ?? ''}',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              RaisedButton(
                  child: Text("Back"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }

  void calculate(String operation) {
    final firstNumber = double.parse(textFieldOne.value.text);
    final secondNumber = double.parse(textFieldTwo.value.text);
    switch (operation) {
      case '+':
        setState(() {
          result = firstNumber + secondNumber;
        });
        break;
      case '-':
        setState(() {
          result = firstNumber - secondNumber;
        });
        break;
      case '*':
        setState(() {
          result = firstNumber * secondNumber;
        });
        break;
      case '/':
        setState(() {
          result = firstNumber / secondNumber;
        });
        break;
    }
  }
}
