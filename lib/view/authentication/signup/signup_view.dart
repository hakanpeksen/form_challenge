import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../components/login_button.dart';
import '../../../product/constants/text/text_constants.dart';
import '../../../product/widget/image/auth_image.dart';
import '../../../product/widget/padding/custom_padding.dart';
import '../../../product/widget/seperate/custom_seperate.dart';
import '../../../product/widget/text/custom_align_text.dart';
import '../../../product/widget/text/custom_text.dart';
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
                  context.emptySizedHeightBoxLow,
                  CustomAlignText(
                      child: CustomText.headline5(TextConstant.registerText, context: context)),
                  context.emptySizedHeightBoxLow,
                  CustomAlignText(
                      child:
                          Text(TextConstant.createAccountText, style: context.textTheme.subtitle1)),
                  context.emptySizedHeightBoxHigh,
                  Padding(
                      padding: const CustomPadding.medium30Horizontal(), child: buildForm(context)),
                  buildHaveAccountButton(context),
                  LoginButton(
                      title: TextConstant.registerText,
                      onCompleted: () async {
                        await checkSignUpForm();
                      }),
                ],
              ),
            );
          }),
    ]));
  }
}
