import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:stopwatch_runner/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

ColorScheme kThemeColor =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 81, 12, 133));
ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 239, 10));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(builder: Builder(builder: (_) {
      return MaterialApp(
        darkTheme: ThemeData.dark()
            .copyWith(colorScheme: kThemeColor, useMaterial3: true),
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme()
                .copyWith(backgroundColor: kColorScheme.onSurfaceVariant)),
        home: const HomeScreen(),
      );
    }));
  }
}
