import 'package:flutter/material.dart';

class BuildButtons extends StatelessWidget {
  const BuildButtons({
    super.key,
    required this.isRunning,
    required this.isCompleted,
    required this.onStop,
    required this.onStart,
    required this.onCancel,
  });
  final bool isRunning;
  final bool isCompleted;
  final VoidCallback onStop;
  final VoidCallback onStart;
  final VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: onStop,
                  child: Text(!isRunning ? "Resume" : "Stop")),
              const SizedBox(width: 12),
              ElevatedButton(onPressed: onCancel, child: const Text("Cancel")),
            ],
          )
        : ElevatedButton(onPressed: onStart, child: const Text("Start timer"));
  }
}
