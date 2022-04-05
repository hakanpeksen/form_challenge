import 'package:flutter/material.dart';
import 'package:form_challenge/product/widget/email_field.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constants/text/text_constants.dart';
import '../../../product/mixin/login_mixin.dart';
import '../../../product/utility/message.dart';
import '../../../product/widget/password_field.dart';
import '../../../product/widget/text/custom_text.dart';
import 'login_model.dart';
import 'login_view.dart';

abstract class LoginViewModel extends State<LoginView> with LoginMixin {
  bool formAutoValidate = false;
  final signUpRouteName = '/signup';
  final homeRouteName = '/home';

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> checkSignInForm() async {
    // if validate
    if (loginFormKey.currentState?.validate() ?? false) {
      await Future.delayed(context.durationNormal); // Duration(seconds: 1);
      // if email password check
      if (emailController.text.trim() == LoginModel.mockUser.email &&
          passwordController.text == LoginModel.mockUser.password) {
        // success message
        Utility.showMessage(text: TextConstant.successLoginText);
        // home view e gider
        await Navigator.pushReplacementNamed(context, homeRouteName);
      }
      // email password hatalı
      else {
        Utility.showMessage(text: TextConstant.notLoginValidate, color: context.colorScheme.error);
      }
    } else {
      _changeValidate();
    }
  }

  void _changeValidate() {
    formAutoValidate = true;
    setState(() {});
  }

  Form buildForm(BuildContext context) {
    return Form(
        autovalidateMode: formAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        key: loginFormKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText.subtitle2(TextConstant.emailText, context: context),
          EmailField(textEditingController: emailController),
          context.emptySizedHeightBoxLow3x,
          CustomText.subtitle2(TextConstant.passwordText, context: context),
          PasswordField(controller: passwordController),
        ]));
  }

  TextButton buildDontHaveAccountButton(BuildContext context) {
    return TextButton(
      child: CustomText.account(TextConstant.dontHaveAccountText, context: context),
      onPressed: () {
        Navigator.pushReplacementNamed(context, signUpRouteName);
      },
    );
  }
}
