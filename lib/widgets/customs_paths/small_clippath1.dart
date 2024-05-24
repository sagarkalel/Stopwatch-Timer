import 'package:flutter/material.dart';

class SmallClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double x = size.width;
    double y = size.height;
    return path
      ..lineTo(0, y)
      ..quadraticBezierTo(x, y, x / 2, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
