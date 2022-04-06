import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'product/app_command.dart';
import 'product/shared_manager.dart';
import 'product/theme_notifier.dart';
import 'view/authentication/login/login_view.dart';
import 'view/authentication/signup/signup_view.dart';
import 'view/home/home_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<ThemeNotifer>(create: (context) => ThemeNotifer())],
    builder: (context, child) => const MyApp(),
  )); //);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    appInit();
    super.initState();
  }

  Future<void> appInit() async {
    initContext(context);
    await SharedManager.initSharedPrefences();
    await AppCommand().init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _currentTheme = context.select((ThemeNotifer c) => c.currentTheme);

    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
        theme: _currentTheme,
        // theme: AppThemeLight.instance.themeDataLight,
        //theme: AppThemeDark.instance.themeDataDark,
        routes: {
          '/home': (context) => const HomeView(),
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignUpView(),
        });
  }
}
