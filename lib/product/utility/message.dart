import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utility {
  static void showMessage({Color color = Colors.green, required String text}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(behavior: SnackBarBehavior.floating, content: Text(text), backgroundColor: color),
    // );
  }
}
