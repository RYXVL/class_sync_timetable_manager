import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  static List<String> timeRange = [
    '${times[0]}-${times[1]}',
    '${times[1]}-${times[2]}',
    '${times[3]}-${times[4]}',
    '${times[4]}-${times[5]}',
    '${times[6]}-${times[7]}',
    '${times[7]}-${times[8]}',
    '${times[9]}-${times[10]}',
    '${times[10]}-${times[11]}',
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

  List<DropdownMenuItem> generateTimeRangeMenuItems() {
    List<DropdownMenuItem> profTimeRangeItems = [];
    for (String range in timeRange) {
      profTimeRangeItems.add(
        DropdownMenuItem(
          child: Text(range),
          value: range,
        ),
      );
    }
    return profTimeRangeItems;
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
          "subjectName": "Math",
          "semester": "Spring",
          "section": "A",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "Physics",
          "semester": "Summer",
          "section": "C",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "Biology",
          "semester": "Fall",
          "section": "E",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Tuesday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "Computer Science",
          "semester": "Spring",
          "section": "A",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "Economics",
          "semester": "Summer",
          "section": "C",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "Psychology",
          "semester": "Spring",
          "section": "D",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "Sociology",
          "semester": "Fall",
          "section": "E",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Wednesday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "Art",
          "semester": "Spring",
          "section": "A",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "Drama",
          "semester": "Summer",
          "section": "C",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "Dance",
          "semester": "Spring",
          "section": "D",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "Film Studies",
          "semester": "Fall",
          "section": "E",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "Literature",
          "semester": "Summer",
          "section": "F",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Thursday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "History",
          "semester": "Summer",
          "section": "F",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Friday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "Physical Education",
          "semester": "Spring",
          "section": "A",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Saturday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "PHY",
          "semester": "Fall",
          "section": "A",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "CHM",
          "semester": "Spring",
          "section": "B",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "BIO",
          "semester": "Summer",
          "section": "C",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    }
  ];

  List dummyTimetable2 = [
    {
      "dayOfWeek": "Monday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "ENG",
          "semester": "Fall",
          "section": "A",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "MTH",
          "semester": "Spring",
          "section": "B",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "PHY",
          "semester": "Summer",
          "section": "C",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Tuesday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "CHE",
          "semester": "Spring",
          "section": "A",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "BIO",
          "semester": "Summer",
          "section": "C",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "HIS",
          "semester": "Spring",
          "section": "D",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "SOC",
          "semester": "Fall",
          "section": "E",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Wednesday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "ART",
          "semester": "Spring",
          "section": "A",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "PHI",
          "semester": "Summer",
          "section": "C",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "PSY",
          "semester": "Spring",
          "section": "D",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "SOC",
          "semester": "Fall",
          "section": "E",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "ECO",
          "semester": "Summer",
          "section": "F",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Thursday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "MAT",
          "semester": "Summer",
          "section": "F",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Friday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "PHY",
          "semester": "Spring",
          "section": "A",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    },
    {
      "dayOfWeek": "Saturday",
      "timetable": [
        {
          "timeStart": "08:00am",
          "timeEnd": "09:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "09:00am",
          "timeEnd": "10:00am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "10:30am",
          "timeEnd": "11:30am",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "11:30am",
          "timeEnd": "12:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "01:00pm",
          "timeEnd": "02:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "02:00pm",
          "timeEnd": "03:00pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "03:30pm",
          "timeEnd": "04:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        },
        {
          "timeStart": "04:30pm",
          "timeEnd": "05:30pm",
          "subjectName": "",
          "semester": "",
          "section": "",
        }
      ]
    }
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
  // Fetches without using custom ID of docs. Has to be decommissioned.
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
  // Fetches without using custom ID of docs. Has to be decommissioned.
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
  // Inserts without using custom ID of docs. Has to be decommissioned.
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
  // Inserts without using custom ID of docs. Has to be decommissioned.
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
      for (var daysTimeTable in dummyTimetable2) {
        String dayOfWeek = daysTimeTable['dayOfWeek'];
        List timetable = daysTimeTable['timetable'];
        // ------------------------------------------------
        await db
            .collection('ABC')
            .doc(dayOfWeek)
            .set({'timetable': timetable}).then((value) {
          print('Document inserted successfully!');
        }).catchError((error) {
          print('Failed to insert document: $error');
        });
      }
      print('Dummy data insertion into Firestore Completed!');
    } catch (e) {
      print('Caught Error: $e');
    }
  }

  // Same as V3 but it takes profCode and data as input to push data
  // Data has to be of form [{'Monday': <array of slots and details>, ...}]
  void insertDummyDataInFirestoreV4(String profCode, dynamic data) async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      for (String day in daysInAWeek) {
        dynamic scheduleForDay =
            data[day]; // list of obj {timestart, timeend, subjectname}
        // print(day)
        await db
            .collection(profCode)
            .doc(day)
            .set({'timetable': scheduleForDay}).then((value) {
          print('Document inserted successfully!');
        }).catchError((error) {
          print('Failed to insert document: $error');
        });
      }
      print('Dummy data insertion into Firestore Completed!');
    } catch (e) {
      print('Caught Error: $e');
    }
  }

  void insertLessonPlanInformation(
      String profCode, dynamic lessonInfo, String lessonPlanData) async {
    try {
      print(lessonInfo);
      FirebaseFirestore db = FirebaseFirestore.instance;
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
      if (lessonInfo["overrideDate"] != "") {
        formattedDate = lessonInfo["overrideDate"];
      }
      dynamic lessonPlanSnapshot =
          await db.collection(profCode).doc('Lesson Plan').get();
      if (lessonPlanSnapshot.exists) {
        Map<String, dynamic> data =
            lessonPlanSnapshot.data() as Map<String, dynamic>;
        print(data);
        // formattedDate = "2024-04-30";
        if (data.containsKey(formattedDate)) {
          dynamic slotsList = data[formattedDate];
          if (slotsList.containsKey(lessonInfo["timeslot"])) {
            // dynamic slotData = slotsList[lessonInfo["timeslot"]];
            data[formattedDate][lessonInfo["timeslot"]]["data"] =
                lessonPlanData;
            await db.collection(profCode).doc('Lesson Plan').update(data);
            print('The key "key3" exists in the map.');
          } else {
            data[formattedDate][lessonInfo["timeslot"]] = {};
            data[formattedDate][lessonInfo["timeslot"]]["data"] =
                lessonPlanData;

            data[formattedDate][lessonInfo["timeslot"]]["section"] =
                lessonInfo["section"];
            data[formattedDate][lessonInfo["timeslot"]]["semester"] =
                lessonInfo["semester"];
            data[formattedDate][lessonInfo["timeslot"]]["subjectName"] =
                lessonInfo["subjectName"];
            // print("Check");
            await db.collection(profCode).doc('Lesson Plan').update(data);
            print('The key "key3" does not exist in the map.');
          }
          print('The key "key2" exists in the map.');
        } else {
          // print('The key "key2" does not exist in the map.');
          data[formattedDate] = {};
          // print("Check");
          data[formattedDate][lessonInfo["timeslot"]] = {};
          data[formattedDate][lessonInfo["timeslot"]]["data"] = lessonPlanData;

          data[formattedDate][lessonInfo["timeslot"]]["section"] =
              lessonInfo["section"];
          data[formattedDate][lessonInfo["timeslot"]]["semester"] =
              lessonInfo["semester"];
          data[formattedDate][lessonInfo["timeslot"]]["subjectName"] =
              lessonInfo["subjectName"];
          // print("Check");
          await db.collection(profCode).doc('Lesson Plan').update(data);

          // lessonInfo.forEach((key, value) {
          //   print('$key: $value');
          // });
        }
        print('Data from document: $data');
      } else {
        print('Document does not exist');
      }
      // lessonInfo.forEach((key, value) {
      //   print('$key: $value');
      // });
      // print("Lesson Info: $lessonInfo");
      // print(lessonPlanSnapshot);
      // await db
      //     .collection(profCode)
      //     .doc('Lesson Plan')
      //     .set({formattedDate: lessonPlanData}).then((value) {
      //   print('Document inserted successfully!');
      // }).catchError((error) {
      //   print('Failed to insert document: $error');
      // });
      // }
      // print('Dummy data insertion into Firestore Completed!');
    } catch (e) {
      print('Caught Error: $e');
    }
  }
}
