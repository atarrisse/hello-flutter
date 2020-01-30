import 'package:flutter/material.dart';
import './bike.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formDistance = 15.0;
  String result = "";
  String _currency = "US\$";
  TextEditingController distanceControler =
      TextEditingController();
  TextEditingController consumptionControler =
      TextEditingController();
  TextEditingController priceControler =
      TextEditingController();

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
              Padding(
                  padding: EdgeInsets.only(
                      bottom: _formDistance),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: distanceControler,
                          decoration: InputDecoration(
                            hintText: "e.g. 124",
                            labelText: 'Distance',
                          ),
                          keyboardType:
                              TextInputType.number,
                        ),
                      ),
                      Container(
                        width: _formDistance,
                      ),
                      Expanded(
                        child: TextField(
                          controller: consumptionControler,
                          decoration: InputDecoration(
                            hintText: "e.g. 17",
                            labelText: 'Distance per Unit',
                          ),
                          keyboardType:
                              TextInputType.number,
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding:
                    EdgeInsets.only(bottom: _formDistance),
                child: TextField(
                  controller: priceControler,
                  decoration: InputDecoration(
                    hintText: "e.g. 1.65",
                    labelText: 'Price',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: _formDistance),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor:
                          Theme.of(context).accentColor,
                      child: Text('Reset'),
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                    ),
                    Container(
                      width: _formDistance,
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor:
                          Theme.of(context).accentColor,
                      child: Text('Submit'),
                      onPressed: () {
                        setState(() {
                          result = _calculate();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Text(result),
              BikeImageWidget(),
            ],
          ),
        ));
  }

  String _calculate() {
    double _distance = double.parse(distanceControler.text);
    double _price = double.parse(priceControler.text);
    double _consumption =
        double.parse(consumptionControler.text);
    double _totalCost = _distance / _consumption * _price;
    String _result = "The total cost of your trip is " +
        _currency +
        _totalCost.toStringAsFixed(2);
    return _result;
  }

  void _reset() {
    distanceControler.text = '';
    consumptionControler.text = '';
    priceControler.text = '';
    setState(() {
      result = '';
    });
  }
}
