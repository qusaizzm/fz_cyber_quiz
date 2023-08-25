import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static final byDarkpripmaryColor = Color(0xFF23232D);
  static final darkpripmaryColor = Color(0xFF1B1C21);
  static final pripmaryColor = Color(0xFF252c4a);
  static final secondaryColor = Color(0xFF117eeb);
  static final orangColor = Color(0xFFFF9F22);
  static final correct = Color.fromARGB(255, 58, 206, 105);
  static final incorrect = Color.fromARGB(255, 216, 59, 59);
  static final neutral = Color(0xFFE7E7E7);
}

Widget hSize() {
  return SizedBox(
    height: 8.5,
  );
}

Widget wSize() {
  return SizedBox(
    width: 8.5,
  );
}

class Styles {
  static TextStyle h1() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
  }

  static friendsBox() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)));
  }

  static messagesCardStyle(check) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: check ? Colors.indigo.shade300: Colors.grey.shade300,
    );
  }

  static messageFieldCardStyle() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(10));
  }

  static messageTextFieldStyle({required Function() onSubmit}) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: 'Enter Message',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: IconButton(onPressed: onSubmit, icon: const Icon(Icons.send)),
    );
  }
  static searchTextFieldStyle() {
    return InputDecoration(
      border: InputBorder.none,
      hintText: 'Enter Name',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
    );
  }
}
