import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<MaterialColor> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  TextStyle colorizeTextStyle = const TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

  void initState() {
    super.initState();

    Timer(
      const Duration(milliseconds: 8500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Loading(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: SplashWid());
  }
}

class SplashWid extends StatelessWidget {
  const SplashWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Lottie.asset('assets/animation/splash.json')),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 80.0, height: 200.0),
            const Text(
              'Quiz',
              style: TextStyle(fontSize: 43.0),
            ),
            const SizedBox(width: 20.0, height: 100.0),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40.0,
                fontFamily: 'Horizon',
                color: Colors.blue,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText('Cyber'),
                  RotateAnimatedText('Security'),
                  RotateAnimatedText('fz'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
