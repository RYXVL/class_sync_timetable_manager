import 'package:animated_text_kit/animated_text_kit.dart';
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
      // backgroundColor: Color(0xFFE8ECEE),
      appBar: AppBar(
        backgroundColor: Color(0xFF141319),
        // title: const Center(
        //   child: Text(
        //     'Welcome Screen',
        //     style: TextStyle(color: Colors.white, fontFamily: 'Gladifilthefte'),
        //   ),
        // ),
        title: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
            fontFamily: 'Gladifilthefte',
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              RotateAnimatedText('CLASS'),
              RotateAnimatedText('TIMETABLE'),
              RotateAnimatedText('MANAGEMENT'),
              RotateAnimatedText('SYSTEM'),
            ],
            // onTap: () {
            //   print("Tap Event");
            // },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RegistrationLoginButton(
              'Login',
              () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            SizedBox(
              width: double.infinity,
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
