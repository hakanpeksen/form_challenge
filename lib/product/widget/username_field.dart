import 'package:flutter/material.dart';

import '../../components/form_field.dart';
import 'package:kartal/kartal.dart';

class UserNameField extends StatelessWidget {
  final TextEditingController textEditingController;
  const UserNameField({Key? key, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      controller: textEditingController,
      validator: (value) => value.isNotNullOrNoEmpty ? null : 'Boş Bırakılamaz',
    );
  }
}
