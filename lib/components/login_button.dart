import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key, required this.title, required this.onCompleted}) : super(key: key);

  final Future<void> Function() onCompleted;
  final String title;

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isLoading = false;

  void _changeLoading() {
    _isLoading = !_isLoading;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(60), primary: context.colorScheme.primary),
      onPressed: () async {
        _changeLoading();
        await widget.onCompleted();
        _changeLoading();
      },
      child: Center(
        child: _isLoading
            ? CircularProgressIndicator(color: context.colorScheme.inversePrimary)
            : Text(widget.title),
      ),
    );
  }
}
