import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../widget_size.dart';

class CustomSeperate extends StatelessWidget {
  const CustomSeperate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: WidgetSize.size50,
            height: WidgetSize.size5,
            color: context.colorScheme.primary));
  }
}
