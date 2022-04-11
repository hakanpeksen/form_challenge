import 'package:flutter/material.dart';

import 'init/theme/app_theme_dark.dart';
import 'init/theme/app_theme_light.dart';

// import 'init/theme/app_theme_dark.dart';
// import 'init/theme/app_theme_light.dart';

enum AppThemes { light, dark }

class ThemeNotifer extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDark => _isDarkTheme;

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.LIGHT]
  AppThemes _currentThemeEnum = AppThemes.light;
  AppThemes get currentThemeEnum => _currentThemeEnum;

  ThemeData _currentTheme = LightTheme().theme;

  set isDark(bool f) {
    _isDarkTheme = f;
    if (_currentThemeEnum == AppThemes.light) {
      _currentTheme = DarkTheme().theme;
    } else {
      _currentTheme = LightTheme().theme;
    }
    notifyListeners();
  }

  ThemeData get currentTheme {
    if (_isDarkTheme) {
      _currentTheme = DarkTheme().theme;
      _currentThemeEnum = AppThemes.dark;
    } else {
      // light tema seçiliyse light temada kalmasını sağlıyor
      _currentTheme = LightTheme().theme;
      _currentThemeEnum = AppThemes.light;
    }
    return _currentTheme;
  }
}
