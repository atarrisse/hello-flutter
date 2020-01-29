import 'package:flutter/material.dart';

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/pizza.png');
    Image image = Image(image: pizzaAsset);
    return Container(
      child: image,
      margin: EdgeInsets.only(bottom: 50.0),
    );
  }
}
