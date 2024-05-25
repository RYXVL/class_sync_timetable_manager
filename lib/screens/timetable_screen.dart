import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../custom_widgets/day_widget.dart';
import '../custom_widgets/lesson_plan_button.dart';
import '../custom_widgets/registration_login_button.dart';
import '../utils/pdf_generator.dart';
import '../utils/pdf_operator.dart';

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

  // List<DropdownMenuItem> generateDaysDropdownMenuItems() {
  //   List<DropdownMenuItem> workingDaysDropdownMenuItems = [];
  //   for (String day in workingDays) {
  //     workingDaysDropdownMenuItems.add(
  //       DropdownMenuItem(
  //         child: Text(day),
  //         value: day,
  //       ),
  //     );
  //   }
  //   return workingDaysDropdownMenuItems;
  // }

  String initialValue = 'Monday';

  bool firstData = true;
  int initialBuild = 0;
  // String fetchedProfCode = '';

  @override
  void initState() {
    // fetchedProfCode = DummyData().getProfCode() as String;
    // getProfCode();
    // dummyData.getDummyDataFromFirebaseFirestore();
    // dummyData.getDummyDataFromFirebaseFirestoreStreams();
    // dummyData.insertDummyDataInFirestoreV1();
    // DummyData dummyData = DummyData();
    // dummyData.insertDummyDataInFirestoreV2();
    // DummyData dummyData = DummyData();
    // dummyData.insertDummyDataInFirestoreV3();
    // initialBuild = true;
  }

  void generatePopUpInfoMessage() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      text: 'There has been an update in your time table!',
    );
  }

  // void updateListViewWithSelectedDay(
  //     String professorCode, List<Text> timetableWidgets) {
  //   timetableWidgets.clear();
  //   timetableWidgets.add(Text(professorCode));
  //   for (var everyDayTimetable in receivedData) {
  //     if (everyDayTimetable['dayOfWeek'] == initialValue) {
  //       String dayOfWeek = everyDayTimetable['dayOfWeek'];
  //       timetableWidgets.add(Text(dayOfWeek));
  //       for (var slot in everyDayTimetable['timetable']) {
  //         String timeStart = slot['timeStart'];
  //         String timeEnd = slot['timeEnd'];
  //         String subjectName = slot['subjectName'];
  //         String semester = slot['semester'];
  //         String section = slot['section'];
  //         timetableWidgets.add(Text(
  //             '$timeStart - $timeEnd: $subjectName -> $semester-$section'));
  //       }
  //       break;
  //     }
  //   }
  // }

  List receivedData = [];

  void generatePDFFromLessonPlanData() async {
    // FirebaseFirestore db = FirebaseFirestore.instance;
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    // if (lessonInfo["overrideDate"] != "") {
    //   formattedDate = lessonInfo["overrideDate"];
    // }
    dynamic lessonPlanSnapshot =
        await db.collection('ABC').doc('Lesson Plan').get();
    if (lessonPlanSnapshot.exists) {
      Map<String, dynamic> completeLessonPlanData =
          lessonPlanSnapshot.data() as Map<String, dynamic>;

      print(completeLessonPlanData);

      final pdfFile = await PDFGenerator.generate(completeLessonPlanData);
      // print(pdfFile);
      // print('Check1');

      PDFOperator.openFile(pdfFile);
      print('Check2');
    } else {
      print('Document does not exist');
    }
  }

  @override
  Widget build(BuildContext context) {
    initialBuild++;
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
          'TIMETABLE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontFamily: 'Gladifilthefte',
          ),
        ),
        // title: const Text('Timetable Screen'),
      ),
      body: SafeArea(
        // child: ListView(
        //   children: dummyData.generateWidgetsForDummyData(),
        // ),
        // TODO: Decide a way so that while logging in a global variable is automatically set which contains the professor code
        child: Column(
          children: [
            // DropdownButton(
            //   value: initialValue,
            //   items: generateDaysDropdownMenuItems(),
            //   onChanged: (newValue) {
            //     setState(() {
            //       firstData = true;
            //       // dataUpdated = false;
            //       initialValue = newValue;
            //     });
            //   },
            // ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection('XYZ').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final timetable = snapshot.data?.docs;
                    List<Widget> timetableWidgets = [];
                    // TODO: Remove hardcoded professor code
                    // timetableWidgets.add(const Text('XYZ'));
                    receivedData.clear();
                    //
                    // timetableWidgets.clear();
                    timetableWidgets.add(Text('XYZ'));
                    for (var everyDayTimetable in timetable!) {
                      // if (everyDayTimetable['dayOfWeek'] == initialValue) {
                      String dayOfWeek = everyDayTimetable.id;
                      timetableWidgets.add(DayWidget(dayOfWeek));
                      for (var slot in everyDayTimetable['timetable']) {
                        String timeStart = slot['timeStart'];
                        String timeEnd = slot['timeEnd'];
                        String subjectName = slot['subjectName'];
                        String semester = slot['semester'];
                        String section = slot['section'];
                        timetableWidgets.add(LessonPlanButton(section, semester,
                            subjectName, timeStart, timeEnd, context));
                      }
                      // break;
                      // }
                    }
                    //
                    // for (var everyDayTimetable in timetable!) {
                    //
                    //   receivedData.add({
                    //     'dayOfWeek': everyDayTimetable.id,
                    //     'timetable': everyDayTimetable['timetable']
                    //   });
                    // }

                    // updateListViewWithSelectedDay('XYZ', timetableWidgets);
                    // () {
                    //   if (firstData) {
                    //     firstData = false;
                    //   } else {
                    //     QuickAlert.show(
                    //       context: context,
                    //       type: QuickAlertType.info,
                    //       text: 'There has been an update in your time table!',
                    //     );
                    //   }
                    // };
                    // fix this bug where the alert is happening even
                    // when just day option is changed apart from
                    // update on firebase
                    // THIS HAS TO BE FIXED
                    // THE ALERT
                    // if (firstData) {
                    //   firstData = false;
                    // } else {
                    //   print('display');
                    //   Future.delayed(Duration.zero, () async {
                    //     generatePopUpInfoMessage();
                    //   });
                    // }
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
            Divider(
              color: Colors.grey, // Color of the line
              thickness: 1, // Thickness of the line
              indent: 20, // Empty space to the leading edge of the divider.
              endIndent: 20, // Empty space to the trailing edge of the divider.
            ),
            RegistrationLoginButton(
              'Filter Vacancy Screen',
              () {
                // print('Ryan'.split(''));
                Navigator.pushNamed(context, '/filtervacancy');
              },
            ),
            RegistrationLoginButton(
              'Push CSV To Firebase Firestore',
              () {
                Navigator.pushNamed(context, '/pushcsv');
              },
            ),
            RegistrationLoginButton(
              'Generate Lesson Plan',
              () {
                // Navigator.pushNamed(context, '/pushcsv');
                generatePDFFromLessonPlanData();
              },
            ),
            // MaterialButton(
            //   onPressed: () {
            //     generatePDFFromLessonPlanData();
            //   },
            //   // final pdfFile = await PdfInvoice
            //   // },
            //   child: Text('Generate Lesson Plan'),
            // )
          ],
        ),
      ),
    );
  }
}
