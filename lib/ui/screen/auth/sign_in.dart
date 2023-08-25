import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
import '../../../domain/firebaseauth_methods.dart';
import '../../widgets/auth/my_textfield.dart';
import '../../widgets/my_button.dart';
import '../home/home.dart';
import 'sign_up.dart';

class SignINQuiz extends StatefulWidget {
  const SignINQuiz({super.key});

  @override
  State<SignINQuiz> createState() => _SignINQuizState();
}

class _SignINQuizState extends State<SignINQuiz> {
  String errorMessage = '';
  User? user = FirebaseAuth.instance.currentUser;
  late bool loggedin;
  FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  // // // ValidationMethods validationMethods = ValidationMethods();

  //text editing controllers
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // sign user in method
  void signUserUp() async {
    if (emailController.text.trim().isEmpty) {
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
    } else {
      firebaseAuthMethods
          .signIn(
              email: emailController.text.trim(),
              password: passController.text.trim(),
              context: context)
          .whenComplete(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen0122(),
          ),
        );
      });
      print("object");
      // }

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => LoginPage(),
      //   ),
      // );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
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
                    'Let\'s Login.',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                    ),
                  ),

                  // email text field

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

                  // sign in button
                  MyButton(
                    text: 'Sign IN',
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
                          'Create Naw an account?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUPQuiz(),
                              ),
                            );
                          },
                          child: const Text(
                            "Create .",
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
