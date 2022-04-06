import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeDark {
  static AppThemeDark? _instance;
  static AppThemeDark get instance => _instance ??= AppThemeDark._init();

  AppThemeDark._init();

  static const meadow = Color(0xff19a54a);
  static const woodsmoke = Color(0xff121515);
  static const white = Color(0xffffffff); // elavated login text
  static const gray = Color(0xff888888); // your email vs text
  static const athensGray = Color(0xfff9fafb); // textfield fillcolor(xx)

  static const scorpion = Color(0xff595959); // search
  static const shark = Color(0xff1a1e1e); // textfield  textstyle

  static const red = Colors.red;

  ThemeData get themeDataDark => ThemeData(
        //  scaffoldBackgroundColor: white,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.karla().fontFamily,
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: athensGray, fontWeight: FontWeight.w400), // sign to account
          subtitle2:
              TextStyle(color: athensGray, fontWeight: FontWeight.w400), // your email, password
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              color: white), // Login, Register başlık // have account fs:16
          headline6: TextStyle(
              fontWeight: FontWeight.bold,
              color: white,
              fontSize: 16), //elevated button Login, Register text
        ),

        // 14px gray, regular
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //     selectedItemColor: flamingo, unselectedItemColor: givry),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(60), primary: meadow),
        ),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: meadow, // elevated button background, seperated color
              onPrimary: woodsmoke, // elavated login text,  draggable container color
              secondary: scorpion,
              onSecondary: scorpion,
              error: red,
              onError: scorpion,
              surface: white, // textfield  textstyle, SecureIcon(IconThemedata ile)
              background: athensGray, // textfield fillcolor
              onSurface: scorpion,
              onBackground: scorpion,
            ),
      );
}
