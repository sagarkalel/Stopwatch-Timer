import 'package:flutter/material.dart';

class BubbleContainer extends StatelessWidget {
  const BubbleContainer({
    super.key,
    this.bottom,
    this.top,
    this.left,
    this.right,
    this.height,
    this.width,
    required this.color,
  });
  final double? right;
  final double? left;
  final double? bottom;
  final double? top;
  final double? height;
  final double? width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      bottom: bottom,
      left: left,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
