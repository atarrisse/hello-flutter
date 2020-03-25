import 'package:flutter/material.dart';
import 'package:hello_flutter/chatbot/components/character/eyePainter.dart';
import 'package:hello_flutter/chatbot/components/character/mouthPainter.dart';

class Character extends StatefulWidget {
  Character({Key key}) : super(key: key);
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character>
    with SingleTickerProviderStateMixin {
  final double characterProportionHeight = 0.225;
  final double characterProportionWidth = 0.65;
  @override
  void initState() {
    super.initState();
  }

  _getCircleDiameter(double height) {
    if (height == null)
      throw ("to get the circle diameter one needs the height of the parent widget");

    return height * this.characterProportionHeight;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 366 / 273,
        child: Container(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Center(
                  child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: CustomPaint(
                                  painter: EyePainter(
                                    height: _getCircleDiameter(
                                        constraints.maxHeight),
                                  ),
                                ),
                                height:
                                    _getCircleDiameter(constraints.maxHeight),
                                width:
                                    _getCircleDiameter(constraints.maxHeight)),
                            Container(
                                child: CustomPaint(
                                  painter: MouthPainter(
                                    height: _getCircleDiameter(
                                        constraints.maxHeight),
                                  ),
                                ),
                                height:
                                    _getCircleDiameter(constraints.maxHeight),
                                width:
                                    _getCircleDiameter(constraints.maxHeight)),
                            Container(
                                child: CustomPaint(
                                  painter: EyePainter(
                                    height: _getCircleDiameter(
                                        constraints.maxHeight),
                                  ),
                                ),
                                height:
                                    _getCircleDiameter(constraints.maxHeight),
                                width:
                                    _getCircleDiameter(constraints.maxHeight)),
                          ]),
                      height: _getCircleDiameter(constraints.maxHeight),
                      width: constraints.maxWidth * characterProportionWidth));
            },
          ),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(100.0),
                  bottomRight: const Radius.circular(100.0))),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
