import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';

class FormTextField extends StatelessWidget {
  //final String label;
  final bool? secure;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const FormTextField(
      {Key? key,
      //required this.label,
      this.secure,
      this.validator,
      this.controller,
      this.keyboardType,
      this.suffixIcon,
      this.inputFormatters})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(0.01)),
      child: TextFormField(
        controller: controller,
        obscureText: secure ?? false,
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: context.textTheme.subtitle2?.copyWith(color: context.colorScheme.surface),
        decoration: InputDecoration(
          errorStyle: context.textTheme.subtitle2?.copyWith(color: context.colorScheme.error),
          errorMaxLines: 2,
          filled: true,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          // labelStyle:
          //     const TextStyle(color: Colors.black87, fontSize: 17, fontFamily: 'AvenirLight'),
          // fillColor: context.colorScheme.background,

          // labelText: label,

          // contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),

          // prefixIcon: Padding(
          //     padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          //     child: Image.asset(iconPath)),
        ),
      ),
    );
  }
}
