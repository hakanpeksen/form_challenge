import 'package:flutter/material.dart';

import 'init/theme/app_theme_dark.dart';
import 'init/theme/theme_manager.dart';

enum AppThemes { light, dark }

class ThemeNotifer extends ChangeNotifier {
  bool _isDarkTheme = false;
  bool get isDark => _isDarkTheme;

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.LIGHT]
  AppThemes _currentThemeEnum = AppThemes.light;
  AppThemes get currentThemeEnum => _currentThemeEnum;

  ThemeData _currentTheme = AppThemeLight.instance.themeDataLight;

  set isDark(bool f) {
    _isDarkTheme = f;
    if (_currentThemeEnum == AppThemes.light) {
      _currentTheme = AppThemeDark.instance.themeDataDark;
    } else {
      _currentTheme = AppThemeLight.instance.themeDataLight;
    }
    notifyListeners();
  }

  ThemeData get currentTheme {
    if (_isDarkTheme) {
      _currentTheme = AppThemeDark.instance.themeDataDark;
      _currentThemeEnum = AppThemes.dark;
    } else {
      // light tema seçiliyse light temada kalmasını sağlıyor
      _currentTheme = AppThemeLight.instance.themeDataLight;
      _currentThemeEnum = AppThemes.light;
    }
    return _currentTheme;
  }
}






// class ThemeNotifer extends ChangeNotifier {
//   bool isDarkTheme = false;

//   void changeTheme() {
//     isDarkTheme = !isDarkTheme;
//     notifyListeners();
//   }

//   ThemeData get currentTheme =>
//       isDarkTheme ? AppThemeDark.instance.themeDataDark : AppThemeLight.instance.themeDataLight;
// }


  // onPressed: () async {
  //             context.read<ThemeNotifer>().changeTheme();
  //             await SharedManager.instace.saveTheme(SharedKeys.currentTheme, true);
  //           }),