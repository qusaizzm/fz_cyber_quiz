import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obsecuretext;
  final String type;

  const MyTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.type,
      required this.obsecuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obsecuretext,
        validator: (value) {
          if (type == "email") {
            if (value!.isEmpty) {
              return "PLease Enter Your Email";
            }
            if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
              return "Please enter a valid email address";
            } else {
              return null;
            }
          } else if (type == "pass") {
            if (value!.isEmpty) {
              return "PLease Enter Your Password";
            }
            // if (!RegExp(
            //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            //     .hasMatch(value)) {
            //   return "Please enter a valid Password";
            // } else {
            //   return null;
            // }
          } else {
            print("object");
          }
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
