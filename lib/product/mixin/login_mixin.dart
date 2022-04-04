import 'package:flutter/material.dart';

mixin LoginMixin {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey();
}
