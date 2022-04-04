import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomText extends Text {
  const CustomText(String data, {Key? key}) : super(data, key: key);

  // loginTitleText, RegisterTitleText
  CustomText.headline5(String data, {Key? key, required BuildContext context})
      : super(data, key: key, style: context.textTheme.headline5);

// email,yourname, PasswordText
  CustomText.subtitle2(String data, {Key? key, required BuildContext context})
      : super(data, key: key, style: context.textTheme.subtitle2);
}
