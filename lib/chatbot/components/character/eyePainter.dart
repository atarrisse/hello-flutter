import 'dart:math';
import 'package:flutter/material.dart';

class EyePainter extends CustomPainter {
  Paint _paint;
  double height;

  EyePainter({this.height}) {
    _paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var leftEye = Offset(0.0, 0.0) & Size(this.height, this.height);
    canvas.drawArc(leftEye, -pi / 3, pi * 3, false, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
