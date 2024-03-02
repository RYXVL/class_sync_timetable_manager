import 'package:flutter/material.dart';

class RegistrationLoginButton extends StatelessWidget {
  String textOnButton;
  dynamic onPressed;

  RegistrationLoginButton(this.textOnButton, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(textOnButton),
    );
  }
}
