import 'package:flutter/material.dart';

import '../../../components/login_button.dart';
import '../../../product/widget/email_field.dart';
import '../../../product/widget/password_field.dart';
import 'login_view_model.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Image.asset('assets/images/bg_image.png', fit: BoxFit.cover),
      Align(
        child: Text(
          'Herbalova',
          style: context.textTheme.headline4?.copyWith(color: Colors.white, fontSize: 36),
        ),
      ),
      DraggableScrollableSheet(
          initialChildSize: 0.1,
          maxChildSize: 0.8,
          minChildSize: 0.1,
          builder: (context, scrollController) {
            return Container(
              color: Colors.white,
              height: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                controller: scrollController,
                children: [
                  Center(child: Container(width: 50, height: 5, color: Colors.yellow)),
                  const SizedBox(height: 20),
                  Text(
                    'Sign to your account',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyText1
                        ?.copyWith(color: const Color(0xff121515), fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: context.textTheme.headline5?.copyWith(
                              color: const Color(0xff121515), fontWeight: FontWeight.bold),
                        ),
                        Form(
                            autovalidateMode: formAutoValidate
                                ? AutovalidateMode.always
                                : AutovalidateMode.disabled,
                            key: loginFormKey,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              const Text('Your Email '),
                              EmailField(
                                textEditingController: userEmailController,
                              ),
                              const Text('Password'),
                              PasswordField(controller: passwordController),
                            ])),
                      ],
                    ),
                  ),
                  const SizedBox(height: 210),
                  TextButton(
                    child: const Text("I don’t have account",
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                  ),
                  LoginButton(
                      title: 'Login',
                      onCompleted: () async {
                        await checkSignInForm();
                      }),
                ],
              ),
            );
          }),
    ]));
  }
}
