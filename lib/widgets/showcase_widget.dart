import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCaseView extends StatelessWidget {
  const ShowCaseView({
    super.key,
    required this.title,
    required this.desc,
    this.shapeBorder = const CircleBorder(),
    required this.globalKey,
    required this.child,
  });
  final String title, desc;
  final ShapeBorder shapeBorder;
  final GlobalKey globalKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: globalKey,
      description: desc,
      title: title,
      targetShapeBorder: shapeBorder,
      child: child,
    );
  }
}
