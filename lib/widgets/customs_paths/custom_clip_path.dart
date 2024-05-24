import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double x = size.width;
    double y = size.height;
    Path path = Path();

    path.moveTo(0, y);
    path.quadraticBezierTo(0, y, x - 50, y - 50);
    path.lineTo(x, y);
    path.lineTo(x, 50);
    path.lineTo(x - 50, 0);
    path.lineTo(0, 50);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
