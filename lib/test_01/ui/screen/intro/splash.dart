import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../quiz_01/quiz01.dart';
import '../../../../quiz_02/quiz02.dart';
import '../../shared/animition.dart';
import '../auth_screen.dart';
import 'loading.dart';
import '../overview_screen.dart';

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
        Duration(seconds: 9),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Loading())));
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
        Lottie.asset('assets/animation/splash.json'),

        const SizedBox(height: 100),

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
                  RotateAnimatedText('Exam'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
        // // Load an animation and its images from a zip file
        // Lottie.asset('assets/lottiefiles/angel.zip'),
      ],
    );
  }
}
