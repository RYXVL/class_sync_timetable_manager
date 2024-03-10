import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/registration_login_button.dart';

// import '../dummy_data.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  // DummyData dummyData = DummyData();
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<String> workingDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  List<DropdownMenuItem> generateDaysDropdownMenuItems() {
    List<DropdownMenuItem> workingDaysDropdownMenuItems = [];
    for (String day in workingDays) {
      workingDaysDropdownMenuItems.add(
        DropdownMenuItem(
          child: Text(day),
          value: day,
        ),
      );
    }
    return workingDaysDropdownMenuItems;
  }

  String initialValue = 'Monday';

  @override
  void initState() {
    // dummyData.getDummyDataFromFirebaseFirestore();
    // dummyData.getDummyDataFromFirebaseFirestoreStreams();
    // dummyData.insertDummyDataInFirestoreV1();
    // dummyData.insertDummyDataInFirestoreV2();
    // DummyData dummyData = DummyData();
    // dummyData.insertDummyDataInFirestoreV3();
  }

  void updateListViewWithSelectedDay(
      String professorCode, List<Text> timetableWidgets) {
    timetableWidgets.clear();
    timetableWidgets.add(Text(professorCode));
    for (var everyDayTimetable in receivedData) {
      if (everyDayTimetable['dayOfWeek'] == initialValue) {
        String dayOfWeek = everyDayTimetable['dayOfWeek'];
        timetableWidgets.add(Text(dayOfWeek));
        for (var slot in everyDayTimetable['timetable']) {
          String timeStart = slot['timeStart'];
          String timeEnd = slot['timeEnd'];
          String subjectName = slot['subjectName'];
          String semester = slot['semester'];
          String section = slot['section'];
          timetableWidgets.add(Text(
              '$timeStart - $timeEnd: $subjectName -> $semester-$section'));
        }
        break;
      }
    }
  }

  List receivedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable Screen'),
      ),
      body: SafeArea(
        // child: ListView(
        //   children: dummyData.generateWidgetsForDummyData(),
        // ),
        // TODO: Decide a way so that while logging in a global variable is automatically set which contains the professor code
        child: Column(
          children: [
            DropdownButton(
              value: initialValue,
              items: generateDaysDropdownMenuItems(),
              onChanged: (newValue) {
                setState(() {
                  initialValue = newValue;
                });
              },
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection('XYZ').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final timetable = snapshot.data?.docs;
                    List<Text> timetableWidgets = [];
                    // TODO: Remove hardcoded professor code
                    // timetableWidgets.add(const Text('XYZ'));
                    receivedData.clear();
                    for (var everyDayTimetable in timetable!) {
                      receivedData.add(everyDayTimetable);
                    }
                    updateListViewWithSelectedDay('XYZ', timetableWidgets);

                    return ListView(
                      children: timetableWidgets,
                    );
                  } else {
                    // print(snapshot.data);
                    print('No data in snapshots.');
                    return const Text('No data in snapshots.');
                  }
                },
              ),
            ),
            RegistrationLoginButton(
              'Filter Vacancy Screen',
              () {
                Navigator.pushNamed(context, '/filtervacancy');
              },
            ),
          ],
        ),
      ),
    );
  }
}
