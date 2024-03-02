import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/registration_login_button.dart';
import '../custom_widgets/registration_login_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            RegistrationLoginTextField(
              'Enter Your Email',
              (value) {
                email = value;
              },
            ),
            RegistrationLoginTextField(
              'Enter Your Password',
              (value) {
                password = value;
              },
            ),
            RegistrationLoginButton(
              'Login',
              () async {
                try {
                  UserCredential user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    print(user);
                    Navigator.pushNamed(context, '/timetable');
                  } else {
                    print('User returned as null.');
                  }
                  // Navigator.pop(context);
                } catch (e) {
                  print('Caught Error: $e');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
