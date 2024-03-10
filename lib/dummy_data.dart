import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DummyData {
  String professorCode = 'XYZ';

  static List<String> daysInAWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  // TODO: To be moved to Firestore
  static List<String> profCodes = [
    'XYZ',
    'ABC',
  ];

  static List<String> times = [
    '08:00am',
    '09:00am',
    '10:00am',
    '10:30am',
    '11:30am',
    '12:30pm',
    '01:00pm',
    '02:00pm',
    '03:00pm',
    '03:30pm',
    '04:30pm',
    '05:30pm',
  ];

  List<DropdownMenuItem> generateProfCodesMenuItems() {
    List<DropdownMenuItem> profCodesMenuItems = [];
    for (String code in profCodes) {
      profCodesMenuItems.add(
        DropdownMenuItem(
          child: Text(code),
          value: code,
        ),
      );
    }
    return profCodesMenuItems;
  }

  List<DropdownMenuItem> generateTimeSlotsMenuItems() {
    List<DropdownMenuItem> profTimeSlotsItems = [];
    for (String time in times) {
      profTimeSlotsItems.add(
        DropdownMenuItem(
          child: Text(time),
          value: time,
        ),
      );
    }
    return profTimeSlotsItems;
  }

  List<DropdownMenuItem> generateDaysInAWeekMenuItems() {
    List<DropdownMenuItem> profDaysInAWeekItems = [];
    for (String day in daysInAWeek) {
      profDaysInAWeekItems.add(
        DropdownMenuItem(
          child: Text(day),
          value: day,
        ),
      );
    }
    return profDaysInAWeekItems;
  }

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

  // Takes data from 'dummyTimetable' list of this class and makes a list of text widgets out
  // of them and returns it.
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

  // Gets all documents from firebase using the professor code and prints the 'dayOfWeek'
  // and 'timetable' from each doc.
  void getDummyDataFromFirebaseFirestore() async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      QuerySnapshot timetable = await db.collection(professorCode).get();
      for (var everyDayTimetable in timetable.docs) {
        print(everyDayTimetable['dayOfWeek']);
        print(everyDayTimetable['timetable']);
      }
    } catch (e) {
      print('Caught Error: $e');
    }
  }

  // Gets all documents from firebase snapshots using the professor code and prints the
  // 'dayOfWeek' and 'timetable' from each doc. Whenever there is a change made in firestore
  // data, it automatically sends the new data to the app and it printed again.
  void getDummyDataFromFirebaseFirestoreStreams() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await for (var snapshot in db.collection(professorCode).snapshots()) {
      for (var everyDayTimetable in snapshot.docs) {
        print(everyDayTimetable['dayOfWeek']);
        print(everyDayTimetable['timetable']);
      }
    }
  }

  // Using the 'dummyTimetable' list of this class it pushes the data to firestore where each
  // doc contains dayOfWeek and one timeslot of that day.
  void insertDummyDataInFirestoreV1() async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      for (var daysTimeTable in dummyTimetable) {
        String dayOfWeek = daysTimeTable['dayOfWeek'];
        List timetable = daysTimeTable['timetable'];
        for (var slot in timetable) {
          String timeStart = slot['timeStart'];
          String timeEnd = slot['timeEnd'];
          String subjectName = slot['subjectName'];
          String semester = slot['semester'];
          String section = slot['section'];
          await db.collection(professorCode).add({
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

  // Using the 'dummyTimetable' list of this class it pushes the data onto firestore where each
  // doc contains the dayOfWeek and the entire timetable for that day.
  void insertDummyDataInFirestoreV2() async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      for (var daysTimeTable in dummyTimetable) {
        String dayOfWeek = daysTimeTable['dayOfWeek'];
        List timetable = daysTimeTable['timetable'];
        await db.collection(professorCode).add({
          'dayOfWeek': dayOfWeek,
          'timetable': timetable,
        });
      }
      print('Dummy data insertion into Firestore Completed!');
    } catch (e) {
      print('Caught Error: $e');
    }
  }

  // Using the 'dummyTimetable' list of this class it pushes data into firestore with each doc
  // having a custom ID consisting of 'professorCode-dayOfWeek' and the data of the doc is the
  // entire timetable for that day.
  void insertDummyDataInFirestoreV3() async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      for (var daysTimeTable in dummyTimetable) {
        String dayOfWeek = daysTimeTable['dayOfWeek'];
        List timetable = daysTimeTable['timetable'];
        // ------------------------------------------------
        await db
            .collection(professorCode)
            .doc('$professorCode-$dayOfWeek')
            .set({'timetable': timetable}).then((value) {
          print('Document inserted successfully!');
        }).catchError((error) {
          print('Failed to insert document: $error');
        });
        // ------------------------------------------------
        // await db.collection(professorCode).add({
        //   'dayOfWeek': dayOfWeek,
        //   'timetable': timetable,
        // });
      }
      print('Dummy data insertion into Firestore Completed!');
    } catch (e) {
      print('Caught Error: $e');
    }
  }
}
