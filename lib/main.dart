import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fz_cyber_quiz/firebase_options.dart';
import 'auth02/ui/main_page.dart';
import 'test_01/test01.dart';
import 'test_01/ui/shared/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      // MyApp()
      const Test01()
      // RiveMyApp()
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.darkpripmaryColor,

      ),
      home: MainPage(),
    );
  }
}
