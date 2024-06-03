import 'package:class_sync_timetable_manager/custom_widgets/registration_login_button.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class LessonPlanScreen extends StatefulWidget {
  final String profCode;
  final String timeslot;
  final String section;
  final String semester;
  final String subjectName;

  const LessonPlanScreen(this.profCode, this.timeslot, this.section,
      this.semester, this.subjectName);

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
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
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
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
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
          ],
        ),
      ),
    );
  }
}
