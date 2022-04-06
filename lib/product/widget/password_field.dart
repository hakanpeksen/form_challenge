import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/form_field.dart';
import '../constants/text/text_constants.dart';
import 'icon/secure_icon.dart';
import 'package:kartal/kartal.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isSecure = true;
  final int _minumumLength = 8;

  void _changeView() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormTextField(
        controller: widget.controller,
        autofillHints: const [AutofillHints.password],
        secure: _isSecure,
        suffixIcon: IconButton(
            onPressed: () {
              _changeView();
            },
            icon: IconTheme(
                data: IconThemeData(color: context.colorScheme.surface),
                child: SecureIcon(isSecure: _isSecure))),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Z|a-z]|[0-9]'))],
        validator: _controlValidate);
  }

  String? _controlValidate(String? value) {
    if (value != null && value.length >= _minumumLength) {
      return null;
    }

    return TextConstant.notPasswordValid;
  }
}
