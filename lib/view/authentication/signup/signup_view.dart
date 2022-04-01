import 'package:flutter/material.dart';
import 'package:form_challenge/product/widget/username_field.dart';

import '../../../components/login_button.dart';
import '../../../product/widget/email_field.dart';
import '../../../product/widget/password_field.dart';
import 'package:kartal/kartal.dart';
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
      child: Container(
        padding: context.isMediumScreen ? const EdgeInsets.all(4) : const EdgeInsets.all(18),
        height: context.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                  autovalidateMode:
                      formAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                  key: loginFormKey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    context.emptySizedHeightBoxNormal,
                    const Text('Register'),
                    context.emptySizedHeightBoxNormal,
                    const Text('YOUR NAME'),
                    UserNameField(
                      textEditingController: userNameController,
                    ),
                    const Text('EMAIL'),
                    EmailField(
                      textEditingController: userEmailController,
                    ),
                    const Text('PASSWORD'),
                    PasswordField(controller: passwordController),
                    TextButton(
                      child: const Text("I have an account",
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                    LoginButton(
                        title: 'Register',
                        onCompleted: () async {
                          await checkSignUpForm();
                        })
                  ])),
            ]),
      ),
    )));
  }
}
