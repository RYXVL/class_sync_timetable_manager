import 'package:flutter/material.dart';

class RegistrationLoginTextField extends StatelessWidget {
  String hintText;
  dynamic onChanged;

  RegistrationLoginTextField(this.hintText, this.onChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: hintText == 'Enter Your Password' ? true : false,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
