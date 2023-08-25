
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fz_cyber_quiz/auth02/widgets/custom_snackbar.dart';

import 'package:flutter/material.dart';



class FirebaseAuthMethods{

  Future signUp({required String email,required String password,required BuildContext context,required GlobalKey<FormState> key}) async{
if(key.currentState!.validate()){
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch (error){
    print('error is $error');
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar().customSnackBar(errorMessage: error.message!));
  }

}
}
    // showDialog(barrierDismissible: false,context: context, builder: (_) => const Center(child: CircularProgressIndicator(),));

  Future signIn({required String email,required String password,required BuildContext context,required GlobalKey<FormState> key}) async{
    if(key.currentState!.validate()){
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      }
      on FirebaseAuthException catch(error){
        print('error is $error');
        ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar().customSnackBar(errorMessage: error.message!));
      }
    }



  }

  Future signOut({required BuildContext context})async{

    try{
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (error){
      print('error is $error');
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar().customSnackBar(errorMessage: error.message!));
    }



  }

}