import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../product/manager/shared_manager.dart';
import '../product/theme_notifier.dart';
import 'authentication/login/login_view.dart';
import 'package:kartal/kartal.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    appInit(context);

    Future.delayed(context.durationNormal).then((_) async {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const LoginView()));
    });
  }

  Future<void> appInit(BuildContext context) async {
    await SharedManager.initSharedPrefences();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    context.read<ThemeNotifer>().isDark =
        SharedManager.instace.getBoolValue(SharedKeys.currentTheme) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
