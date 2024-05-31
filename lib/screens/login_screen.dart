import 'package:class_sync_timetable_manager/dummy_data.dart';
import 'package:class_sync_timetable_manager/screens/timetable_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/registration_login_button.dart';
import '../custom_widgets/registration_login_text_field.dart';

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// TODO: Add loading screen for registration and login screen

class _LoginScreenState extends State<LoginScreen> {
  // TODO: Remove this default email and password put for testing
  String email = 'xyz@email.com';
  String password = 'xyz@123';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton(
          // style: ButtonStyle(
          // backgroundColor: ,
          // ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontFamily: 'Gladifilthefte',
          ),
        ),
        // title: const Text('Login Screen'),
        // Gladifilthefte
        // title: AnimatedTextKit(
        //   repeatForever: true,
        //   animatedTexts: [
        //     FadeAnimatedText(
        //       'LOGIN',
        //       textStyle: TextStyle(color: Colors.white),
        //     ),
        // FadeAnimatedText(
        //   'do it RIGHT!!',
        //   textStyle: TextStyle(color: Colors.white),
        // ),
        // FadeAnimatedText(
        //   'do it RIGHT NOW!!!',
        //   textStyle: TextStyle(color: Colors.white),
        // ),
        // ],
        //   onTap: () {
        //     print("Tap Event");
        //   },
        // ),
        backgroundColor: Color(0xFF141319),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
                  // print('Email: $email');
                  // print('Pass: $password');
                  UserCredential user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    String profCode = await DummyData().getProfCode();
                    // print(user);
                    print('Prof code inside login screen: $profCode');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TimetableScreen(profCode);
                    }));

                    // Navigator.pushNamed(context, '/timetable',
                    //     arguments: {'profCode': profCode});
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
