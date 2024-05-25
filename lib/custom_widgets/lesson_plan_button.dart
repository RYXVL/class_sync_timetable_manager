import 'package:class_sync_timetable_manager/custom_widgets/timeslot_widget.dart';
import 'package:class_sync_timetable_manager/screens/lesson_plan_screen.dart';
import 'package:flutter/material.dart';

class LessonPlanButton extends StatelessWidget {
  String section;
  String semester;
  String subjectName;
  String timeStart;
  String timeEnd;

  // dynamic onPressed;
  BuildContext context;

  // LessonPlanButton(this.section, this.semester, this.subjectName,
  //     this.timeStart, this.timeEnd, this.onPressed,
  //     {super.key});

  LessonPlanButton(this.section, this.semester, this.subjectName,
      this.timeStart, this.timeEnd, this.context,
      {super.key});

  String getButtonText() {
    String textOnButton = "";
    if (section != "" && semester != "" && subjectName != "") {
      textOnButton = '$timeStart-$timeEnd: $semester-$section-$subjectName';
    } else {
      textOnButton = '$timeStart-$timeEnd: FREE';
    }
    return textOnButton;
  }

  dynamic getButtonFunction() {
    dynamic buttonFunction = () {};
    if (section != "" && semester != "" && subjectName != "") {
      buttonFunction = () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LessonPlanScreen(
                  "$timeStart-$timeEnd", section, semester, subjectName)),
        );
        // Navigator.pushNamed(
        //   context,
        //   '/lessonplan',
        //   arguments: {
        //     "timeslot": "$timeStart-$timeEnd",
        //     "section": section,
        //     "semester": semester,
        //     "subjectName": subjectName,
        //   },
        // );
      };
    }
    return buttonFunction;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: getButtonFunction(),
      // child: Text(getButtonText()),
      child: TimeslotWidget(timeStart, timeEnd, semester, section, subjectName),
    );
  }
}
