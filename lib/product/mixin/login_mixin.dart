import 'package:flutter/material.dart';

mixin LoginMixin {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey();

  final double initialChildSize = 0.1;
  final double maxChildSize = 0.8;
  final double minChildSize = 0.1;
}
