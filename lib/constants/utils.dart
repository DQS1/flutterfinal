import 'package:flutter/material.dart';

class Utils {
  static String url = 'http://192.168.234.1:5000';



  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter email";
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Enter Valid Email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter password";
    }
    if (value.length < 8) {
      return "Password more than 8 characters";
    } else {
      return null;
    }
  }

  static bool equalsIgnoreCase(String? a, String? b) =>
      (a == null && b == null) ||
      (a != null && b != null && a.toLowerCase() == b.toLowerCase());

  static String? confirmPassword(String password, String confirmPassword) {
    if (!equalsIgnoreCase(password, confirmPassword)) {
      return "Confirm password invalid";
    }
    return null;
  }

  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
          behavior: SnackBarBehavior.floating,
        content: Text(text),
      ),
    );
  }
}
