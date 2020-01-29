import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _currencies = ['Dollars', 'Euro', 'Pounds'];

  String name = "";
  String _currency = 'Dollars';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: 'Please insert your name'),
                onChanged: (String string) {
                  setState(() {
                    name = string;
                  });
                },
              ),
              DropdownButton<String>(
                value: _currency,
                items: _currencies.map((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                onChanged: (String value) {
                  _onDropdownChanges(value);
                },
              ),
              Text('Hello ' + name + '!')
            ],
          ),
        ));
  }

  _onDropdownChanges(String value) {
    setState(() {
      this._currency = value;
    });
  }
}
