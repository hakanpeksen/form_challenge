import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../authentication/signup/signup_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''), automaticallyImplyLeading: false),
      body: Center(
          child: Text('Welcome ${SignUpModel.mockUser.username} ',
              style: context.textTheme.headline5)),
    );
  }
}
