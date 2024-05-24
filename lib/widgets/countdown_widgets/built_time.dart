import 'package:flutter/material.dart';

class BuildTime extends StatelessWidget {
  const BuildTime({
    super.key,
    required this.time,
    required this.header,
  });
  final String time;
  final String header;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
          child: Text(
            time,
            style: const TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          header,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
