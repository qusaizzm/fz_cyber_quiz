import 'package:flutter/material.dart';
import 'package:fz_cyber_quiz/auth03/utility/constant.dart';

Widget signTextformfield(
    {required String type,
    required String hint_text,
    required myfocus,
    required Icon prefix_icon,
    required TextEditingController cotr}) {
  return TextFormField(
    controller: cotr,
    focusNode: myfocus,
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
        if (!RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value)) {
          return "Please enter a valid Password";
        } else {
          return null;
        }
      }
    },
    obscureText: type == "pass" ? true : false,
    style: TextStyle(color: Style.black),
    decoration:
        textInputDecoration(prefix_icon: prefix_icon, hint_text: hint_text),
  );
}

Widget reg_password_textFormField(
    String hintText, TextEditingController regPassword) {
  return TextFormField(
      controller: regPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return "PLease Enter Your Password";
        }
        if (!RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value)) {
          return "Please enter a valid Password";
        } else {
          return null;
        }
      },
      obscureText: true,
      style: TextStyle(color: Style.black),
      decoration: textInputDecoration(
          hint_text: hintText,
          prefix_icon: Icon(
            Icons.lock,
            color: Style.grey,
          )));
}

Widget reg_re_password_textFormField(
    String hintText, TextEditingController regRePassword) {
  return TextFormField(
    controller: regRePassword,
    validator: (value) {
      if (value!.isEmpty) {
        return "PLease Enter Your Password";
      }
      if (!RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(value)) {
        return "Please enter a valid Password";
      } else {
        return null;
      }
    },
    obscureText: true,
    style: TextStyle(color: Style.black),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Style.grey),
      prefixIcon: Icon(
        Icons.lock,
        color: Style.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Style.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      border: new OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: new BorderSide(color: Style.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(width: 1, color: Style.grey),
      ),
    ),
  );
}

Widget reg_phone_number(TextEditingController phoneNum) {
  return TextFormField(
    controller: phoneNum,
    validator: (value) {
      if (value!.isEmpty) {
        return "PLease Enter Your Password";
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.number,
    style: TextStyle(color: Style.black),
    decoration: InputDecoration(
      hintText: 'Enter Phone Number',
      hintStyle: TextStyle(color: Style.grey),
      prefixIcon: Icon(
        Icons.phone,
        color: Style.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Style.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      border: new OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: new BorderSide(color: Style.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(width: 1, color: Style.grey),
      ),
    ),
  );
}

InputDecoration textInputDecoration(
    {required String hint_text, required Icon prefix_icon}) {
  return InputDecoration(
    hintText: hint_text,
    hintStyle: TextStyle(color: Style.grey),
    prefixIcon: prefix_icon,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Style.grey),
      borderRadius: BorderRadius.circular(20.0),
    ),
    border: new OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: new BorderSide(color: Style.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(width: 1, color: Style.grey),
    ),
  );
}
