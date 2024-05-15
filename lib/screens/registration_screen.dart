import 'package:cloud_firestore/cloud_firestore.dart';
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
  String profCode = '';
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
          'REGISTRATION',
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
        // title: const Text('Registration Screen'),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                initialValue: profCode,
                onChanged: (newValue) {
                  setState(() {
                    profCode = newValue;
                  });
                },
              ),
            ),
            // Row(
            //   children: [
            //     // const Text('Enter your code: '),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: TextFormField(
            //         decoration: InputDecoration(
            //           hintText: 'Enter Your Code',
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //             borderSide: BorderSide(
            //               color: Colors.black,
            //             ),
            //           ),
            //         ),
            //         initialValue: profCode,
            //         onChanged: (newValue) {
            //           setState(() {
            //             profCode = newValue;
            //           });
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            RegistrationLoginButton(
              'Register',
              () async {
                try {
                  UserCredential user =
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                  if (user != null) {
                    FirebaseFirestore db = FirebaseFirestore.instance;
                    if (profCode != "") {
                      await db
                          .collection('PROFCODES')
                          .doc(email)
                          .set({'code': profCode});
                    }
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
