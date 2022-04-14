import 'package:flutter/material.dart';

import '../theme/app_theme_dark.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifer extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDark => _isDarkTheme;
  ThemeData _currentTheme = LightTheme().theme;

  set isDark(bool f) {
    _isDarkTheme = f;
    notifyListeners();
  }

  ThemeData get currentTheme {
    if (_isDarkTheme) {
      _currentTheme = DarkTheme().theme;
    } else {
      _currentTheme = LightTheme().theme;
    }
    return _currentTheme;
  }
}
