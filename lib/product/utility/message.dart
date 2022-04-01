import 'package:flutter/material.dart';

class Utility {
  static void showMessage(BuildContext context,
      {Color color = Colors.green, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(text), backgroundColor: color),
    );
  }
}
