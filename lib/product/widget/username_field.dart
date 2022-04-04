import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/form_field.dart';
import '../constants/text/text_constants.dart';

class UserNameField extends StatelessWidget {
  final TextEditingController textEditingController;
  const UserNameField({Key? key, required this.textEditingController}) : super(key: key);

// space tuşuna basınca işlem yapmaz
// sadece harf girebilir

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      controller: textEditingController,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
      ],
      validator: (value) => (value?.isNotEmpty ?? false) ? null : TextConstant.notUserNameValid,
    );
  }
}
