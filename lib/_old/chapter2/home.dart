import 'package:flutter/material.dart';
import './pizza.dart';
import './orderButton.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Color.fromRGBO(250, 141, 160, 1.0),
        padding: EdgeInsets.only(
            left: 12.0, right: 12.0, top: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            PizzaImageWidget(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Text("Margherita",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Color.fromRGBO(
                                29, 166, 193, 1.0),
                            decoration: TextDecoration.none,
                            fontFamily: 'Oxygen',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold))),
                Expanded(
                    child: Text("Tomato, Mozzarella, Basil",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Color.fromRGBO(
                                251, 206, 168, 1.0),
                            decoration: TextDecoration.none,
                            fontFamily: 'Oxygen',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Text("Marinara",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Color.fromRGBO(
                                29, 166, 193, 1.0),
                            decoration: TextDecoration.none,
                            fontFamily: 'Oxygen',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold))),
                Expanded(
                    child: Text("Tomato, Garlic",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Color.fromRGBO(
                                251, 206, 168, 1.0),
                            decoration: TextDecoration.none,
                            fontFamily: 'Oxygen',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)))
              ],
            ),
            OrderButton()
          ],
        ));
  }
}
