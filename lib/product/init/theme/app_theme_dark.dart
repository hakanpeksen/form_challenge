import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  final _darkColor = _DarkColor();

  late ThemeData theme;

  DarkTheme() {
    theme = ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.karla().fontFamily,
        textTheme: TextTheme(
          subtitle1: TextStyle(
              color: _darkColor.athensGray, fontWeight: FontWeight.w400), // sign to account
          subtitle2: TextStyle(
              color: _darkColor.athensGray, fontWeight: FontWeight.w400), // your email, password
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              color: _darkColor.white), // Login, Register başlık // have account fs:16
          headline6: TextStyle(
              fontWeight: FontWeight.bold,
              color: _darkColor.white,
              fontSize: 16), //elevated button Login, Register text
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(60), primary: _darkColor.meadow),
        ),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: _darkColor.meadow, // elevated button background, seperated color
              onPrimary: _darkColor.woodsmoke, // elavated login text,  draggable container color
              secondary: _darkColor.scorpion,
              onSecondary: _darkColor.scorpion,
              error: _darkColor.red,
              onError: _darkColor.scorpion,
              surface: _darkColor.white, // textfield  textstyle, SecureIcon(IconThemedata ile)
              background: _darkColor.athensGray, // textfield fillcolor
              onSurface: _darkColor.scorpion,
              onBackground: _darkColor.scorpion,
            ));
  }
}

class _DarkColor {
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
