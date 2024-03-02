import 'package:flutter/material.dart';

class RegistrationLoginTextField extends StatelessWidget {
  String hintText;
  dynamic onChanged;

  RegistrationLoginTextField(this.hintText, this.onChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onChanged: onChanged,
    );
  }
}
