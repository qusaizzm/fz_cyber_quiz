import 'package:flutter/material.dart';
import 'package:fz_cyber_quiz/rive_animeted/screens/samples_list_view.dart';
import 'package:fz_cyber_quiz/rive_animeted/samples/ui/rive_app/home.dart';
import 'package:fz_cyber_quiz/rive_animeted/samples/animations/grid_magnification/grid_magnification.dart';
 

class RiveMyApp extends StatelessWidget {
  const RiveMyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        RiveAppHome.route: (context) => const RiveAppHome(),
        GridMagnification.route: (context) => const GridMagnification(),
      },
      home: const SamplesListView(
        title: "Flutter Samples",
        backEnabled: false,
      ),
    );
  }
}
