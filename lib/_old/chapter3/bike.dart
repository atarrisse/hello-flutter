import 'package:flutter/material.dart';

class BikeImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage bikeAsset = AssetImage('images/bike.png');
    Image image = Image(
      alignment: Alignment.center,
      image: bikeAsset,
      width: 250.0,
    );
    return Container(
      alignment: Alignment.center,
      child: image,
      margin: EdgeInsets.only(top: 50.0),
    );
  }
}
