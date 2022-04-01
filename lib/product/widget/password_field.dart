import 'package:flutter/material.dart';

import '../../components/form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isScure = true;
  final int _minumumLength = 8;

  void _changeView() {
    setState(() {
      _isScure = !_isScure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      controller: widget.controller,
      secure: _isScure,
      suffixIcon: IconButton(
        onPressed: () {
          _changeView();
        },
        icon: _isScure ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
      ),
      validator: _controlValidate,
    );
  }

  String? _controlValidate(String? value) {
    value = value?.replaceAll(' ', '');

    bool? hasUppercase = value?.contains(RegExp(r'[A-Z|a-z]')) ?? false;
    bool? hasDigits = value?.contains(RegExp(r'[0-9]')) ?? false;

    if (value != null && value.length >= _minumumLength && hasDigits && hasUppercase) {
      return null;
    }

    return 'Şifre en az 1 adet harf ve rakam içermeli ve en az 8 karakter olmalıdır';
  }
}
