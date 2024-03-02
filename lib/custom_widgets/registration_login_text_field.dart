import 'package:flutter/material.dart';

class RegistrationLoginTextField extends StatelessWidget {
  String hintText;

  RegistrationLoginTextField(this.hintText, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
