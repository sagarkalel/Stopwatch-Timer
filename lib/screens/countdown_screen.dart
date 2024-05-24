import 'dart:async';

import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:stopwatch_runner/main.dart';
import 'package:stopwatch_runner/widgets/countdown_widgets/built_time.dart';
import 'package:stopwatch_runner/widgets/countdown_widgets/count_down_buttons.dart';
import 'package:stopwatch_runner/widgets/showcase_widget.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  Duration duration = const Duration();
  Timer? timer;
  bool isCountdown = true;
  static const Duration countDownDuration = Duration(minutes: 10);
  GlobalKey keyOne = GlobalKey();

  @override
  void initState() {
    super.initState();
    reset();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      return ShowCaseWidget.of(context).startShowCase([keyOne]);
    });
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countDownDuration);
    } else {
      setState(() => duration = Duration.zero);
    }
  }

  void startTime({bool resets = false}) {
    if (resets) {
      reset();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => addTime());
  }

  void addTime() {
    final int addSecond = isCountdown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSecond;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = false}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  String getTwoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  String get getSeconds => getTwoDigits(duration.inSeconds.remainder(60));
  String get getMinutes => getTwoDigits(duration.inMinutes.remainder(60));
  String get getHours => getTwoDigits(duration.inHours);
  bool getIsRunning() {
    bool value;
    if (isCountdown) {
      value = timer == null ? false : timer!.isActive;
    } else {
      value = timer == null ? false : timer!.isActive;
    }
    return value;
  }

  bool getIsComleted() {
    bool value;
    if (isCountdown) {
      value = duration.inSeconds == 0 || duration == countDownDuration;
    } else {
      value = duration.inSeconds == 0;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(!isCountdown ? "Stopwatch timer" : "Countdown timer"),
        actions: [
          ShowCaseView(
            title: "Switch here",
            desc: "Switch between Stopwatch timer and Countdown timer",
            globalKey: keyOne,
            child: Switch(
                value: isCountdown,
                activeTrackColor: kColorScheme.error,
                onChanged: (value) => setState(() {
                      isCountdown = value;
                      stopTimer(resets: true);
                    })),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildTime(time: getHours, header: "Hours"),
              const SizedBox(width: 8),
              BuildTime(time: getMinutes, header: "Minutes"),
              const SizedBox(width: 8),
              BuildTime(time: getSeconds, header: "Seconds"),
            ],
          ),
          const SizedBox(height: 20),
          BuildButtons(
            isRunning: getIsRunning(),
            isCompleted: getIsComleted(),
            onStart: () => startTime(resets: true),
            onCancel: () => stopTimer(resets: true),
            onStop: () {
              if (getIsRunning()) {
                stopTimer();
              } else {
                startTime();
              }
            },
          ),
        ],
      ),
    );
  }
}
