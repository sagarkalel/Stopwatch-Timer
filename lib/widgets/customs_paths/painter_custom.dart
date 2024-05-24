import 'package:flutter/material.dart';

class PainterCustom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width;
    double y = size.height;
    Paint paint = Paint();
    paint.color = Colors.white70;
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;
    // ..color = Colors.white70
    // ..strokeWidth = 1
    // ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(x - 50, y - 50);
    path.lineTo(x - 50, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
