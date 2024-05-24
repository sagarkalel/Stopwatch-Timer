import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:stopwatch_runner/screens/countdown_screen.dart';
import 'package:stopwatch_runner/widgets/showcase_widget.dart';
import '../widgets/decoration_widgets/background_widget.dart';
import '../widgets/customs_paths/custom_clip_path.dart';
import '../widgets/customs_paths/painter_custom.dart';
import '../widgets/customs_paths/smal_clippath2.dart';
import '../widgets/customs_paths/small_clippath1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer timer;
  Stopwatch _stopwatch = Stopwatch();
  GlobalKey keyTwo = GlobalKey();

  String formatedReturnText() {
    int mili = _stopwatch.elapsed.inMilliseconds;
    String miliseconds = (mili % 1000).toString().padLeft(3, '0');
    String seconds = ((mili ~/ 1000) % 60).toString().padLeft(2, '0');
    String minutes = ((mili ~/ 1000) ~/ 60).toString().padLeft(2, '0');
    return '$minutes:$seconds:$miliseconds';
  }

  void handleStartStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      setState(() {});
    } else {
      _stopwatch.start();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_stopwatch.isRunning) {
        setState(() {});
      }
    });
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => ShowCaseWidget.of(context).startShowCase([keyTwo]));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
      ),
      body: Stack(
        children: [
          const BackgroundWidget(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    width: w - 30,
                    height: h - 300,
                    decoration: const BoxDecoration(color: Colors.orange),
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(w - 30, h - 300),
                          painter: PainterCustom(),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoButton(
                                onPressed: () => handleStartStopwatch(),
                                child: ShowCaseView(
                                  title: "Stopwatch",
                                  desc: "Tap here to start stopwatch!",
                                  globalKey: keyTwo,
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(1, 1),
                                              color: Colors.black12,
                                              spreadRadius: 4)
                                        ]),
                                    child: Stack(
                                      children: [
                                        ClipPath(
                                          clipper: SmallClipPath1(),
                                          child: Container(
                                            height: 200,
                                            width: 200,
                                            color:
                                                Colors.green.withOpacity(0.2),
                                          ),
                                        ),
                                        ClipPath(
                                          clipper: SmallClipPath2(),
                                          child: Container(
                                            height: 200,
                                            width: 200,
                                            color:
                                                Colors.purple.withOpacity(0.2),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            formatedReturnText(),
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (_stopwatch.elapsed.inMicroseconds != 0)
                                SizedBox(
                                  height: 50,
                                  child: CupertinoButton.filled(
                                    child: const Text("Reset"),
                                    onPressed: () {
                                      // _stopwatch.reset();
                                      _stopwatch = Stopwatch();
                                      setState(() {});
                                    },
                                  ),
                                )
                              else
                                const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const CountdownScreen()));
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Check Countdown Timer'),
                      Icon(CupertinoIcons.forward)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
