import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
        margin: EdgeInsets.only(top: 50.0),
        child: RaisedButton(
            child: Text(
              "Order your pizza!",
              style: TextStyle(
                color: Color.fromRGBO(71, 51, 50, 1.0),
              ),
            ),
            color: Color.fromRGBO(251, 206, 168, 1.0),
            elevation: 5.0,
            onPressed: () {
              order(context);
            }));
    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order completed"),
      content: Text("Thanks for your order"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) => alert);
  }
}
