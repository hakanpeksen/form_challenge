import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../components/login_button.dart';
import '../../../product/constants/text/text_constants.dart';
import '../../../product/widget/email_field.dart';
import '../../../product/widget/password_field.dart';
import '../../../product/widget/text/custom_text.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            context.isMediumScreen
                ? context.emptySizedHeightBoxLow3x
                : context.emptySizedHeightBoxHigh,
            Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomText.headline5(TextConstant.loginText, context: context))),

            context.emptySizedHeightBoxLow,
            Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(TextConstant.signinText, style: context.textTheme.subtitle1))),
            context.emptySizedHeightBoxHigh,
            Form(
                key: loginFormKey,
                autovalidateMode:
                    formAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      CustomText.subtitle2(TextConstant.emailText, context: context),
                      EmailField(textEditingController: emailController),
                      context.emptySizedHeightBoxLow3x,
                      CustomText.subtitle2(TextConstant.passwordText, context: context),
                      PasswordField(controller: passwordController),
                    ]))),
            context.isMediumScreen
                ? SizedBox(height: context.dynamicHeight(0.04))
                : SizedBox(height: context.dynamicHeight(0.27)),
            //const Spacer(),
            TextButton(
              child: Text(TextConstant.dontHaveAccountText,
                  style: context.textTheme.headline5?.copyWith(fontSize: 16)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, signUpRouteName);
              },
            ),
            LoginButton(
                title: TextConstant.loginText,
                onCompleted: () async {
                  await checkSignInForm();
                }),
          ],
        ),
      ),
    ));
  }
}
