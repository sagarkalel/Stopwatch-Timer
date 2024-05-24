import 'package:flutter/material.dart';

import 'bubble_container.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 170, 201, 255)),
      child: Stack(children: [
        BubbleContainer(
          color: Colors.deepOrange.withOpacity(0.1),
          right: -150,
          top: 100,
          height: 300,
          width: 300,
        ),
        BubbleContainer(
          color: Colors.deepPurple.withOpacity(0.1),
          top: -50,
          right: -100,
          height: 200,
          width: 300,
        ),
        BubbleContainer(
          color: Colors.deepPurple.withOpacity(0.1),
          bottom: -150,
          left: -100,
          height: 400,
          width: 400,
        ),
        BubbleContainer(
          color: Colors.red.withOpacity(0.1),
          top: 10,
          left: -200,
          height: 300,
          width: 300,
        ),
      ]),
    );
  }
}
