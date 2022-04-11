import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// https://material.io/design/typography/the-type-system.html#type-scale

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      scaffoldBackgroundColor: _lightColor.white,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.karla().fontFamily,
      textTheme: TextTheme(
        subtitle1: TextStyle(color: _lightColor.gray), // sign to account
        subtitle2:
            TextStyle(color: _lightColor.gray, fontWeight: FontWeight.w400), // your email, password
        headline5: TextStyle(
            fontWeight: FontWeight.bold,
            color: _lightColor.woodsmoke), // Login, Register başlık // have account fs:16
        headline6: TextStyle(
            fontWeight: FontWeight.bold,
            color: _lightColor.white,
            fontSize: 16), //elevated button Login, Register text
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(60), primary: _lightColor.meadow),
      ),
      colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: _lightColor.meadow, // elevated button background
          onPrimary: _lightColor.white, // elavated login text
          secondary: _lightColor.scorpion,
          onSecondary: _lightColor.scorpion,
          error: _lightColor.red,
          onError: _lightColor.scorpion,
          surface: _lightColor.shark, // textfield  textstyle
          background: _lightColor.athensGray, // textfield fillcolor
          onSurface: _lightColor.scorpion,
          onBackground: _lightColor.scorpion),
    );
  }
}

class _LightColor {
  final meadow = const Color(0xff19a54a);
  final woodsmoke = const Color(0xff121515);
  final white = const Color(0xffffffff); // elavated login text
  final gray = const Color(0xff888888); // your email vs text
  final athensGray = const Color(0xfff9fafb); // textfield fillcolor(xx)

  final scorpion = const Color(0xff595959); // search
  final shark = const Color(0xff1a1e1e); // textfield  textstyle

  //1a1e1e  16px 400
  final red = Colors.red;
}
