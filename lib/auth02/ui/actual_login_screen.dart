import 'package:firebase_auth/firebase_auth.dart';
import 'package:fz_cyber_quiz/auth02/domain/validation_methods.dart';
import 'package:flutter/material.dart';

import '../domain/firebaseauth_methods.dart';
import '../widgets/textform_widget.dart';

class ActualLoginScreen extends StatelessWidget {
  const ActualLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String errorMessage = '';
    User? user = FirebaseAuth.instance.currentUser;
    bool loggedin;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods();
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    ValidationMethods validationMethods = ValidationMethods();

    return Form(
      key: _key,
      child: SafeArea(
        child: Column(
          children: [
            TextFormWidget(
                hintText: 'email',
                controller: emailController,
                validator: validationMethods.validateEmail),
            TextFormWidget(
                hintText: 'password',
                controller: passwordController,
                validator: validationMethods.validatePassword),
            TextButton(
                onPressed: () {
                  firebaseAuthMethods.signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context,
                      key: _key);
                },
                child: Center(
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('sign up'),
                        GestureDetector(
                          onTap: () {
                            firebaseAuthMethods.signIn(
                                email: emailController.text,
                                password: passwordController.text,
                                context: context,
                                key: _key);
                          },
                          child: const Text(
                            'sign in',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
