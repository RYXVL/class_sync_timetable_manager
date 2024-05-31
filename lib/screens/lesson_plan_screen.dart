import 'package:class_sync_timetable_manager/custom_widgets/registration_login_button.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class LessonPlanScreen extends StatefulWidget {
  // final Object? arguments;
  final String profCode;
  final String timeslot;
  final String section;
  final String semester;
  final String subjectName;

  const LessonPlanScreen(this.profCode, this.timeslot, this.section,
      this.semester, this.subjectName);

  // const LessonPlanScreen({Key? key}) : super(key: key);

  @override
  State<LessonPlanScreen> createState() => _LessonPlanScreenState();
}

class _LessonPlanScreenState extends State<LessonPlanScreen> {
  String lessonPlanData = "";
  String overrideDate = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF141319),
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
          'LESSON PLAN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontFamily: 'Gladifilthefte',
          ),
        ),
        // title: const Text(
        //   'Lesson Plan Screen',
        // ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Enter contents of lesson taught: ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontFamily: 'DMSerifDisplay',
              ),
              // textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: lessonPlanData,
                onChanged: (newValue) {
                  setState(() {
                    lessonPlanData = newValue;
                  });
                },
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              'Enter override date in YYYY-MM-DD: ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontFamily: 'DMSerifDisplay',
              ),
            ),
            // AnimatedTextKit(
            //   repeatForever: true,
            //   animatedTexts: [
            //     FadeAnimatedText(
            //         'NOTE: Leave empty if today\'s date to be chosen.'),
            //     // FadeAnimatedText('do it RIGHT!!'),
            //     // FadeAnimatedText('do it RIGHT NOW!!!'),
            //   ],
            //   onTap: () {
            //     print("Tap Event");
            //   },
            // ),
            const Text(
              'NOTE: Leave empty if today\'s date to be chosen.',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15.0,
                fontFamily: 'DMSerifDisplay',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: overrideDate,
                onChanged: (newValue) {
                  setState(() {
                    overrideDate = newValue;
                  });
                },
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RegistrationLoginButton(
              'Insert Lesson Plan',
              () {
                Map<String, String> scheduleData = {
                  "overrideDate": overrideDate,
                  "timeslot": widget.timeslot,
                  "section": widget.section,
                  "semester": widget.semester,
                  "subjectName": widget.subjectName
                };
                DummyData().insertLessonPlanInformation(
                    widget.profCode, scheduleData, lessonPlanData);
              },
            ),
            // MaterialButton(
            //   onPressed: () {
            //     Map<String, String> scheduleData = {
            //       "overrideDate": overrideDate,
            //       "timeslot": widget.timeslot,
            //       "section": widget.section,
            //       "semester": widget.semester,
            //       "subjectName": widget.subjectName
            //     };
            //     DummyData().insertLessonPlanInformation(
            //         'ABC', scheduleData, lessonPlanData);
            //   },
            //   child: Text('Insert Lesson Plan'),
            // )
          ],
        ),
      ),
    );
  }
}
