import 'package:flutter/material.dart';
import 'package:form_challenge/product/constants/text/text_constants.dart';
import 'package:kartal/kartal.dart';

import '../../../components/login_button.dart';
import '../../../product/widget/email_field.dart';
import '../../../product/widget/password_field.dart';
import '../../../product/widget/text/custom_text.dart';
import '../../../product/widget/username_field.dart';
import 'signup_view_model.dart';

// width >600 && width<900
// dikey:width:411, dikey:height:683
// yatay: width:683, yatay: height: 411,

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends SignUpViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(children: [
          context.isMediumScreen
              ? context.emptySizedHeightBoxLow3x
              : context.emptySizedHeightBoxNormal,
          Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomText.headline5(TextConstant.registerText, context: context))),
          context.emptySizedHeightBoxLow,
          Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(TextConstant.createAccountText, style: context.textTheme.subtitle1))),
          context.emptySizedHeightBoxHigh,
          Form(
              key: loginFormKey,
              autovalidateMode:
                  formAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CustomText.subtitle2(TextConstant.yourNameText, context: context),
                    UserNameField(
                      textEditingController: userNameController,
                    ),
                    context.isMediumScreen
                        ? context.emptySizedHeightBoxLow
                        : context.emptySizedHeightBoxLow3x,
                    CustomText.subtitle2(TextConstant.emailText, context: context),
                    EmailField(
                      textEditingController: emailController,
                    ),
                    context.isMediumScreen
                        ? context.emptySizedHeightBoxLow
                        : context.emptySizedHeightBoxLow3x,
                    CustomText.subtitle2(TextConstant.passwordText, context: context),
                    PasswordField(controller: passwordController),
                  ]))),
          context.isMediumScreen
              ? const SizedBox.shrink()
              : SizedBox(height: context.dynamicHeight(0.17)),
          TextButton(
            child: Text(TextConstant.haveAccountText,
                style: context.textTheme.headline5?.copyWith(fontSize: 16)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, loginRouteName);
            },
          ),
          LoginButton(
              title: TextConstant.registerText,
              onCompleted: () async {
                await checkSignUpForm();
              }),
        ]),
      ),
    ));
  }
}
