import 'package:flutter/material.dart';

import '../../../product/utility/message.dart';

import '../../home/home_view.dart';
import 'login_model.dart';
import 'login_view.dart';

abstract class LoginViewModel extends State<LoginView> {
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey();

  bool formAutoValidate = false;

  Future<void> checkSignInForm() async {
    // if validate
    if (loginFormKey.currentState?.validate() ?? false) {
      await Future.delayed(const Duration(seconds: 1));
      // if email password check
      if (userEmailController.text == LoginModel.mockUser.email &&
          passwordController.text == LoginModel.mockUser.password) {
        // success message
        Utility.showMessage(context, text: 'Hoşgeldin');
        // home view e gider
        await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext context) => const HomeView()));
      }
      // email password hatalı
      else {
        Utility.showMessage(context, text: 'Şifre veya email hatalı', color: Colors.red);
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
