import 'package:flutter/material.dart';

import '../custom_widgets/registration_login_button.dart';
import '../custom_widgets/registration_login_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            RegistrationLoginTextField('Enter Your Email'),
            RegistrationLoginTextField('Enter Your Password'),
            RegistrationLoginButton(
              'Register',
              () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
