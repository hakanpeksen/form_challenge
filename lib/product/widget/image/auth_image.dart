import 'package:flutter/material.dart';

import '../../constants/text/text_constants.dart';

class AuthImage extends StatelessWidget {
  const AuthImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(TextConstant.imagePath, fit: BoxFit.cover);
  }
}
