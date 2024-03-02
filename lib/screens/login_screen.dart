import 'package:flutter/material.dart';

import '../custom_widgets/registration_login_button.dart';
import '../custom_widgets/registration_login_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              'Login',
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
