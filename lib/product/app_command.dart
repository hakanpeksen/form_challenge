import 'package:flutter/material.dart';
import 'package:form_challenge/product/shared_manager.dart';
import 'package:provider/provider.dart';

import 'theme_notifier.dart';

late BuildContext _mainContext;
void initContext(BuildContext context) => _mainContext = context;

class AppCommand {
  /// [MyApp] de  [appInit() methodunda çağırılır
  ThemeNotifer theme = _mainContext.read();

  Future<void> init() async {
    theme.isDark = SharedManager.instace.getBoolValue(SharedKeys.currentTheme) ?? false;
  }

  Future<bool> saveTheme(bool t) async {
    bool? result = await SharedManager.instace.saveTheme(SharedKeys.currentTheme, t);
    if (result) {
      theme.isDark = t;
    }
    return result;
  }
}
