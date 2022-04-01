import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  //final String label;
  final bool? secure;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const FormTextField(
      {Key? key,
      //required this.label,
      this.secure,
      this.validator,
      this.controller,
      this.keyboardType,
      this.suffixIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextFormField(
        controller: controller,
        obscureText: secure ?? false,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          // labelStyle:
          //     const TextStyle(color: Colors.black87, fontSize: 17, fontFamily: 'AvenirLight'),
          //   fillColor: context.colorScheme.onSecondary,
          //fillColor: const Color(0xfff9fafb),
          fillColor: Colors.amber,
          filled: true,
          // labelText: label,
          border: InputBorder.none,
          // contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          suffixIcon: suffixIcon,
          // prefixIcon: Padding(
          //     padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          //     child: Image.asset(iconPath)),
        ),
      ),
    );
  }
}
