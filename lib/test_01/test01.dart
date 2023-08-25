import 'package:flutter/material.dart';
import 'ui/screen/intro/splash.dart';
import 'ui/shared/constant.dart';

class Test01 extends StatelessWidget {
  const Test01({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColor.darkpripmaryColor,
          appBarTheme: AppBarTheme(
            color: const Color(0xFF151026),
          ),
        ),
        home: SplashScreen());
  }
}
