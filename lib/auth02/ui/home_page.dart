import 'package:firebase_auth/firebase_auth.dart';
import 'package:fz_cyber_quiz/auth02/domain/firebaseauth_methods.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.email!,style: TextStyle(
              color: Colors.black,fontSize: 40
            ),),


            TextButton(onPressed: () {

firebaseAuthMethods.signOut(context: context);
            },
            child: Text('logout',style: TextStyle(color: Colors.red),),),
          ],
        ),
      ),

    );
  }
}
