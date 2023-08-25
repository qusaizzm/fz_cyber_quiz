import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; 
import '../../../domain/firebaseauth_methods.dart';
import '../../widgets/auth/my_textfield.dart';
import '../../widgets/my_button.dart';
import 'sign_in.dart';

class SignUPQuiz extends StatefulWidget {
  const SignUPQuiz({super.key});

  @override
  State<SignUPQuiz> createState() => _SignUPQuizState();
}

class _SignUPQuizState extends State<SignUPQuiz> {
  String errorMessage = '';
  User? user = FirebaseAuth.instance.currentUser;
  late bool loggedin;
  FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  // // // ValidationMethods validationMethods = ValidationMethods();

  //text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final conPassController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // sign user in method
  void signUserUp() async {
    if (_key.currentState!.validate()) {
      if (passController.text.trim() != conPassController.text.trim()) {
        Fluttertoast.showToast(
            msg: "Password and re password are not same",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            // backgroundColor: Style.white,
            // textColor: Style.black,
            fontSize: 14.0);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text("Sign up Success  "),
          ),
        );
      }
    }
    if (nameController.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Name",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          // backgroundColor: Style.white,
          // textColor: Style.black,
          fontSize: 14.0);
    } else if (emailController.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Email",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          // backgroundColor: Style.white,
          // textColor: Style.black,
          fontSize: 14.0);
    } else if (passController.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Password",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          // backgroundColor: Style.white,
          // textColor: Style.black,
          fontSize: 14.0);
    } else if (conPassController.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Re Password",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          // backgroundColor: Style.white,
          // textColor: Style.black,
          fontSize: 14.0);
      // } else if (phone_num.text.trim().isEmpty) {
      //   Fluttertoast.showToast(
      //       msg: "Please Enter Phone Number",
      //       toastLength: Toast.LENGTH_SHORT,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Style.white,
      //       textColor: Style.black,
      //       fontSize: 14.0);
    } else if (passController.text.trim() != conPassController.text.trim()) {
      Fluttertoast.showToast(
          msg: "Password and re password are not same",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          // backgroundColor: Style.white,
          // textColor: Style.black,
          fontSize: 14.0);
    } else {
      // addUserDetails(
      //     email: emailController.text.trim(), name: nameController.text.trim());
      firebaseAuthMethods.signUp(
          email: emailController.text.trim(),
          password: passController.text.trim(),
          context: context,
          name: nameController.text.trim());
      // }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignINQuiz(),
        ),
      );
    }
  }

  Future addUserDetails({required String name, required String email}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'name': name, 'email': email});
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    conPassController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  //logo
                  const Icon(
                    Icons.lock,
                    size: 50,
                  ),
                  const SizedBox(height: 50),

                  //lets create an account for you
                  Text(
                    'Let\'s create an account.',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                    ),
                  ),

                  // email text field
                  MyTextField(
                    hintText: 'Your Name.',
                    controller: nameController,
                    type: "name",
                    obsecuretext: false,
                  ),
                  const SizedBox(height: 5),
                  MyTextField(
                    hintText: 'Email.',
                    controller: emailController,
                    type: "email",
                    obsecuretext: false,
                  ),

                  const SizedBox(height: 5),
                  //passsword field
                  MyTextField(
                    hintText: 'Password',
                    controller: passController,
                    obsecuretext: true,
                    type: "pass",
                  ),
                  const SizedBox(height: 5),

                  // confirm password field
                  MyTextField(
                    hintText: 'Confirm Password',
                    controller: conPassController,
                    type: "pass",
                    obsecuretext: true,
                  ),

                  const SizedBox(height: 25),
                  // sign in button
                  MyButton(
                    text: 'Sign Up',
                    onTap: signUserUp,
                  ),

                  const SizedBox(height: 40),

                  const SizedBox(height: 25),

                  // google + apple sign in
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SquareTile(
                  //       imagePath: 'assets/icons/google.png',
                  //       onTap: () => AuthService().signInWithGoogle(),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 10),

                  // not a member register now
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignINQuiz(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login Now.",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
