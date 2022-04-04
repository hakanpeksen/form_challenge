import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

import '../../../components/login_button.dart';
import '../../../product/constants/text/text_constants.dart';
import '../../../product/widget/image/auth_image.dart';
import '../../../product/widget/padding/custom_padding.dart';
import '../../../product/widget/seperate/custom_seperate.dart';
import '../../../product/widget/text/custom_align_text.dart';
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
        body: Stack(fit: StackFit.expand, children: [
      const AuthImage(),
      Align(child: CustomText.headline6(TextConstant.imageTitle, context: context)),
      DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          maxChildSize: maxChildSize,
          minChildSize: minChildSize,
          builder: (context, scrollController) {
            return Container(
              color: context.colorScheme.onPrimary,
              child: ListView(
                // shrinkWrap: true,
                padding: const CustomPadding.top10(),
                controller: scrollController,
                children: [
                  const CustomSeperate(),
                  context.emptySizedHeightBoxLow, // height: 0.01
                  CustomAlignText(
                      child: CustomText.headline5(TextConstant.loginText, context: context)),
                  context.emptySizedHeightBoxLow,
                  CustomAlignText(
                      child: Text(TextConstant.signinText, style: context.textTheme.subtitle1)),
                  context.emptySizedHeightBoxHigh, // height: 0.1
                  Padding(
                      padding: const CustomPadding.medium30Horizontal(), child: buildForm(context)),
                  buildDontHaveAccountButton(context),
                  LoginButton(
                      title: TextConstant.loginText,
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
