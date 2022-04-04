import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constants/text/text_constants.dart';
import '../../../product/mixin/login_mixin.dart';
import '../../../product/utility/message.dart';
import '../../../product/widget/email_field.dart';
import '../../../product/widget/password_field.dart';
import '../../../product/widget/text/custom_text.dart';
import '../../../product/widget/username_field.dart';
import 'signup_model.dart';
import 'signup_view.dart';

abstract class SignUpViewModel extends State<SignUpView> with LoginMixin {
  bool formAutoValidate = false;
  final loginRouteName = '/login';
  final homeRouteName = '/home';

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> checkSignUpForm() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      await Future.delayed(context.durationNormal);
      if (userNameController.text == SignUpModel.mockUser.username &&
          emailController.text.trim() == SignUpModel.mockUser.email &&
          passwordController.text == SignUpModel.mockUser.password) {
        // kullanıcı kayıtlı, error message
        Utility.showMessage(text: TextConstant.emailExist, color: context.colorScheme.error);

        // login view e at
        Navigator.pushReplacementNamed(context, loginRouteName);
      }
      // kullanıcı kayıt edilmeli burada, şimdilik homeview e gider
      else {
        Utility.showMessage(text: TextConstant.successSignupText);
        Utility.showMessage(text: 'yeni kullanıcı girdi ${userNameController.text}');
        // home view e at
        await Navigator.pushReplacementNamed(context, homeRouteName);
      }
    } else {
      _changeValidate();
    }
  }

  void _changeValidate() {
    formAutoValidate = true;
    setState(() {});
  }

  Column buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
            autovalidateMode:
                formAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
            key: loginFormKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText.subtitle2(TextConstant.yourNameText, context: context),
              UserNameField(textEditingController: userNameController),
              context.emptySizedHeightBoxLow3x,
              CustomText.subtitle2(TextConstant.emailText, context: context),
              EmailField(textEditingController: emailController),
              context.emptySizedHeightBoxLow3x,
              CustomText.subtitle2(TextConstant.passwordText, context: context),
              PasswordField(controller: passwordController),
            ])),
      ],
    );
  }

  TextButton buildHaveAccountButton(BuildContext context) {
    return TextButton(
      child: CustomText.account(TextConstant.haveAccountText, context: context),
      onPressed: () {
        Navigator.pushReplacementNamed(context, loginRouteName);
      },
    );
  }
}
