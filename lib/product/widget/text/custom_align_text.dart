import 'package:flutter/material.dart';

import '../padding/custom_padding.dart';

class CustomAlignText extends StatelessWidget {
  const CustomAlignText({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const CustomPadding.left30(),
        child: Align(alignment: Alignment.topLeft, child: child));
  }
}
