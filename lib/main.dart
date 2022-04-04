import 'package:flutter/material.dart';

import 'product/init/theme/theme_manager.dart';
import 'view/authentication/login/login_view.dart';
import 'view/authentication/signup/signup_view.dart';
import 'view/home/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
        theme: AppThemeLight.instance.themeDataLight,
        routes: {
          '/home': (context) => const HomeView(),
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignUpView(),
        });
  }
}
