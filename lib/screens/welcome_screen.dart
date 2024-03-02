import 'package:flutter/material.dart';

import '../custom_widgets/registration_login_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            RegistrationLoginButton(
              'Login',
              () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            RegistrationLoginButton(
              'Register',
              () {
                Navigator.pushNamed(context, '/registration');
              },
            ),
          ],
        ),
      ),
    );
  }
}
