import 'package:firebase_auth/firebase_auth.dart';
import 'package:fz_cyber_quiz/auth02/ui/actual_login_screen.dart';
import 'package:fz_cyber_quiz/auth02/ui/home_page.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            if (kDebugMode) {
             return const Center(child: Text('there is some error'));
            }
          }
          return const ActualLoginScreen();
        },
      ),
    );
  }
}
