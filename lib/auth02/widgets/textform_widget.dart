import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({Key? key, required this.hintText, required this.controller, required this.validator}) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintText: hintText,
      ),

    );
  }
}
