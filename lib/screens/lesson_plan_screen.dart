import 'package:flutter/material.dart';

import '../dummy_data.dart';

class LessonPlanScreen extends StatefulWidget {
  // final Object? arguments;
  final String timeslot;
  final String section;
  final String semester;
  final String subjectName;

  const LessonPlanScreen(
      this.timeslot, this.section, this.semester, this.subjectName);

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
        title: const Text(
          'Lesson Plan Screen',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Enter contents of lesson taught: ',
              // textAlign: TextAlign.left,
            ),
            TextFormField(
              initialValue: lessonPlanData,
              onChanged: (newValue) {
                setState(() {
                  lessonPlanData = newValue;
                });
              },
            ),
            const Text('Enter override date in YYYY-MM-DD: '),
            const Text('(leave empty if today\'s date to be chosen)'),
            TextFormField(
              initialValue: overrideDate,
              onChanged: (newValue) {
                setState(() {
                  overrideDate = newValue;
                });
              },
            ),
            MaterialButton(
              onPressed: () {
                Map<String, String> scheduleData = {
                  "overrideDate": overrideDate,
                  "timeslot": widget.timeslot,
                  "section": widget.section,
                  "semester": widget.semester,
                  "subjectName": widget.subjectName
                };
                DummyData().insertLessonPlanInformation(
                    'ABC', scheduleData, lessonPlanData);
              },
              child: Text('Insert Lesson Plan'),
            )
          ],
        ),
      ),
    );
  }
}
