
import 'package:flutter/material.dart';


class CustomSnackbar{
  SnackBar customSnackBar({required String errorMessage}){

    return SnackBar(
      content:  Text(errorMessage),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }




}

