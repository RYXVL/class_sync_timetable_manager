import 'package:flutter/material.dart';

class RegistrationLoginButton extends StatelessWidget {
  String textOnButton;
  dynamic onPressed;

  RegistrationLoginButton(this.textOnButton, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Color(0xFF141319),
      onPressed: onPressed,
      child: Text(
        textOnButton,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
