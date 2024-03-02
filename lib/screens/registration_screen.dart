import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/registration_login_button.dart';
import '../custom_widgets/registration_login_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Screen'),
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
              'Register',
              () async {
                try {
                  UserCredential user =
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, '/timetable');
                    // print(user);
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
