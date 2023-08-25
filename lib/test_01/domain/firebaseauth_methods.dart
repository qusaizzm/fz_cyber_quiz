import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fz_cyber_quiz/auth02/widgets/custom_snackbar.dart';

import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signUp(
      {required String email,
      required String password,
      name,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({'uid': userCredential.user!.uid, 'email': email, 'name': name});
    } on FirebaseAuthException catch (error) {
      print('error is $error');
      // ScaffoldMessenger.of(context).showSnackBar(
      //     CustomSnackbar().customSnackBar(errorMessage: error.message!));
    }
  }
  // showDialog(barrierDismissible: false,context: context, builder: (_) => const Center(child: CircularProgressIndicator(),));

  Future signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      print('error is $error');
      ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackbar().customSnackBar(errorMessage: error.message!));
    }
  }

  Future signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (error) {
      print('error is $error');
      ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackbar().customSnackBar(errorMessage: error.message!));
    }
  }
}
