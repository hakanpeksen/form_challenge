import 'package:flutter/material.dart';

import '../../../product/utility/message.dart';
import '../../home/home_view.dart';
import 'signup_model.dart';
import 'signup_view.dart';

abstract class SignUpViewModel extends State<SignUpView> {
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey();

  bool formAutoValidate = false;

  Future<void> checkSignUpForm() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      await Future.delayed(const Duration(seconds: 1));
      if (userNameController.text == SignUpModel.mockUser.username &&
          userEmailController.text == SignUpModel.mockUser.email &&
          passwordController.text == SignUpModel.mockUser.password) {
        // kullanıcı kayıtlı, error message
        Utility.showMessage(context, text: 'Bu Email daha önceden kayıtlıdır', color: Colors.red);
        // login view e at
        Navigator.pushReplacementNamed(context, '/login');
      }
      // kullanıcı kayıt edilmeli, homeview e gider
      else {
        Utility.showMessage(context, text: 'Create User Successfully');
        // home view e at
        await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext context) => const HomeView()));
      }
    } else {
      _changeValidate();
    }
  }

  void _changeValidate() {
    formAutoValidate = true;
    setState(() {});
  }
}
