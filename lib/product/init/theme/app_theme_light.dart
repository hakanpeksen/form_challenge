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
class AppThemeLight {
  static AppThemeLight? _instance;
  static AppThemeLight get instance => _instance ??= AppThemeLight._init();

  AppThemeLight._init();

  static const meadow = Color(0xff19a54a);
  static const woodsmoke = Color(0xff121515);
  static const white = Color(0xffffffff); // elavated login text
  static const gray = Color(0xff888888); // your email vs text
  static const athensGray = Color(0xfff9fafb); // textfield fillcolor(xx)

  static const scorpion = Color(0xff595959); // search
  static const shark = Color(0xff1a1e1e); // textfield  textstyle

  //1a1e1e  16px 400
  static const red = Colors.red;

  ThemeData get themeDataLight => ThemeData(
        scaffoldBackgroundColor: white,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.karla().fontFamily,
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: gray), // sign to account
          subtitle2: TextStyle(color: gray, fontWeight: FontWeight.w400), // your email, password
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              color: woodsmoke), // Login, Register başlık // have account fs:16
          headline6: TextStyle(
              fontWeight: FontWeight.bold,
              color: white,
              fontSize: 16), //elevated button Login, Register text
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(60), primary: meadow),
        ),
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: meadow, // elevated button background
              onPrimary: white, // elavated login text
              secondary: scorpion,
              onSecondary: scorpion,
              error: red,
              onError: scorpion,
              surface: shark, // textfield  textstyle
              background: athensGray, // textfield fillcolor
              onSurface: scorpion,
              onBackground: scorpion,
            ),
      );
}
