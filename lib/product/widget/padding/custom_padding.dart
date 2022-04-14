import 'package:flutter/material.dart';

import '../../widget_size.dart';

class CustomPadding extends EdgeInsets {
  const CustomPadding() : super.all(10);

  const CustomPadding.top10() : super.only(top: WidgetSize.size10);

  const CustomPadding.left30() : super.only(left: WidgetSize.size30);

  const CustomPadding.medium30Horizontal() : super.symmetric(horizontal: WidgetSize.size30);
}
