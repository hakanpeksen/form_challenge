import 'package:flutter/material.dart';

abstract class ValidateStatefull<T extends StatefulWidget> extends State<T> {
  bool formAutoValidate = false;

  void changeValidate() {
    formAutoValidate = true;
    setState(() {});
  }
}
