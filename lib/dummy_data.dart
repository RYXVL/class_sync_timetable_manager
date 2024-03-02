import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DummyData {
  String professorCode = 'XYZ';

  List dummyTimetable = [
    {
      "dayOfWeek": "Monday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:00am",
          "timeEnd": "10:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "12:30pm",
          "timeEnd": "01:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:00pm",
          "timeEnd": "03:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
      ],
    },
    {
      "dayOfWeek": "Tuesday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:00am",
          "timeEnd": "10:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "12:30pm",
          "timeEnd": "01:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:00pm",
          "timeEnd": "03:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
      ],
    },
    {
      "dayOfWeek": "Wednesday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:00am",
          "timeEnd": "10:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "12:30pm",
          "timeEnd": "01:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:00pm",
          "timeEnd": "03:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
      ],
    },
    {
      "dayOfWeek": "Thursday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:00am",
          "timeEnd": "10:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "12:30pm",
          "timeEnd": "01:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:00pm",
          "timeEnd": "03:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
      ],
    },
    {
      "dayOfWeek": "Friday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:00am",
          "timeEnd": "10:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "12:30pm",
          "timeEnd": "01:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:00pm",
          "timeEnd": "03:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
      ],
    },
    {
      "dayOfWeek": "Saturday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:00am",
          "timeEnd": "10:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "12:30pm",
          "timeEnd": "01:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:00pm",
          "timeEnd": "03:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "testsubject",
          "semester": "testsemester",
          "section": "testsection",
        },
      ],
    },
  ];

  List<Widget> generateWidgetsForDummyData() {
    List<Widget> generatedList = [];
    generatedList.add(Text('Professor Code: $professorCode'));
    for (var daysTimeTable in dummyTimetable) {
      generatedList.add(Text(daysTimeTable['dayOfWeek']));
      List timetable = daysTimeTable['timetable'];
      for (var slot in timetable) {
        String timeStart = slot['timeStart'];
        String timeEnd = slot['timeEnd'];
        String subjectName = slot['subjectName'];
        String semester = slot['semester'];
        String section = slot['section'];
        generatedList.add(
            Text('$timeStart - $timeEnd: $subjectName -> $semester-$section'));
      }
    }
    return generatedList;
  }

  void insertDummyDataInFirestoreV1() async {
    try {
      FirebaseFirestore _db = FirebaseFirestore.instance;
      for (var daysTimeTable in dummyTimetable) {
        String dayOfWeek = daysTimeTable['dayOfWeek'];
        List timetable = daysTimeTable['timetable'];
        for (var slot in timetable) {
          String timeStart = slot['timeStart'];
          String timeEnd = slot['timeEnd'];
          String subjectName = slot['subjectName'];
          String semester = slot['semester'];
          String section = slot['section'];
          await _db.collection(professorCode).add({
            'dayOfWeek': dayOfWeek,
            'timeStart': timeStart,
            'timeEnd': timeEnd,
            'subjectName': subjectName,
            'semester': semester,
            'section': section,
          });
        }
      }
      print('Dummy data insertion into Firestore Completed!');
    } catch (e) {
      print('Caught Error: $e');
    }
  }

  void insertDummyDataInFirestoreV2() async {
    try {
      FirebaseFirestore _db = FirebaseFirestore.instance;
      for (var daysTimeTable in dummyTimetable) {
        String dayOfWeek = daysTimeTable['dayOfWeek'];
        List timetable = daysTimeTable['timetable'];
        await _db.collection(professorCode).add({
          'dayOfWeek': dayOfWeek,
          'timetable': timetable,
        });
      }
      print('Dummy data insertion into Firestore Completed!');
    } catch (e) {
      print('Caught Error: $e');
    }
  }
}
