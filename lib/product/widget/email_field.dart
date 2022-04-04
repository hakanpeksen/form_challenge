import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../components/form_field.dart';
import '../constants/text/text_constants.dart';

class EmailField extends StatelessWidget {
  final TextEditingController textEditingController;
  const EmailField({Key? key, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      controller: textEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => (value ?? '').isValidEmail ? null : TextConstant.notEmailValid,
    );
  }
}
