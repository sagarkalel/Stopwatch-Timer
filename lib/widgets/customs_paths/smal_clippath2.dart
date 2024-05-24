import 'package:flutter/material.dart';

class SmallClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double x = size.width;
    double y = size.height;
    return path
      ..moveTo(x, y)
      ..lineTo(0, y / 2)
      ..quadraticBezierTo(x, y - 10, x, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
