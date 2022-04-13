import 'package:flutter/material.dart';

import 'product/theme_notifier.dart';
import 'view/authentication/login/login_view.dart';
import 'view/authentication/signup/signup_view.dart';
import 'view/home/home_view.dart';
import 'package:provider/provider.dart';

import 'view/splash_view.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<ThemeNotifer>(create: (context) => ThemeNotifer())],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        theme: context.watch<ThemeNotifer>().currentTheme,
        routes: {
          '/home': (context) => const HomeView(),
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignUpView(),
        });
  }
}
