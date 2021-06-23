import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController _value = TextEditingController();
  bool _switchValue = true;
  String _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesaplayıcı"),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.blue])),
          child: Column(
            children: [
              TextField(
                controller: _value,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Değerli Paketiniz varmı ?",
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                  CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  calculate(_value.text);
                },
                child: Center(
                  child: Text("Hesapla"),
                ),
              ),
              Text(_result != null ? _result : "Lütfen İşlem Yapınız"),
            ],
          )),
    );
  }

  void calculate(String calculatex) {
    int input = int.tryParse(calculatex);
    var result;
    if (input != null) {
      if (_switchValue) {
        result = input * 0.845;
        setState(() {
          _result = result.toString();
        });
      } else {
        result = input * 0.65;
        setState(() {
          _result = result.toString();
        });
      }
    } else {
      print("no input");
    }
  }
}
