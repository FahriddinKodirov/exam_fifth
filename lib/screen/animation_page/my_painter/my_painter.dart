import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0;

    Path path = Path();
    //P0
    path.lineTo(0, size.height * 0.5);

    path.cubicTo(
      size.width * 0.4,
      size.height * 0.29,
      size.width * 0.58,
      size.height * 0.74,
      size.width,
      size.height * 0.5,
    );

    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}