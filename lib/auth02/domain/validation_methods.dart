class ValidationMethods {
  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'E-mail address is required';
    }

    String pattern = r'\w+@\w+\.\w+';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(formEmail)) {
      return 'Invalid E-mail address format';
    }

    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password  is required';
    }
    // String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$';
    // RegExp regExp = RegExp(pattern);
    // if(!regExp.hasMatch(formPassword)){
    //   return '''
    //   Minimum eight characters,
    //   at least one upper case English letter,
    //   one lower case English letter, one number and one special character ''';   }
    return null;
  }
}
