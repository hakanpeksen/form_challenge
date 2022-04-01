import 'package:flutter/material.dart';

import 'view/authentication/login/login_view.dart';
import 'view/authentication/signup/signup_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: const LoginView(),
        // theme: LighTheme().theme,
        //theme: ThemeManager.createTheme(AppThemeLight()),
        routes: {
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignUpView(),
        });
  }
}
