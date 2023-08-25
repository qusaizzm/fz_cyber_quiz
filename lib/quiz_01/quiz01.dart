import 'package:flutter/material.dart';
import 'screens/main_menu.dart';

class Quiz01 extends StatelessWidget {
  const Quiz01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainMenu(),
    );
  }
}
