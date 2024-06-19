import 'package:class_sync_timetable_manager/screens/push_csv_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';

import '../custom_widgets/day_widget.dart';
import '../custom_widgets/lesson_plan_button.dart';
import '../custom_widgets/registration_login_button.dart';
import '../utils/pdf_generator.dart';
import '../utils/pdf_operator.dart';

class TimetableScreen extends StatefulWidget {
  String profCode;
  TimetableScreen(this.profCode);

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<String> workingDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  String initialValue = 'Monday';

  bool firstData = true;
  int initialBuild = 0;

  @override
  void initState() {
    print('Inside timetable screen init state - profCode: ${widget.profCode}');
  }

  void generatePopUpInfoMessage() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      text: 'There has been an update in your time table!',
    );
  }

  List receivedData = [];

  Future<int> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      print(
          'FUNC: requestStoragePermission | VAR: NONE | Storage Permission Granted');
      return 0;
    } else {
      print(
          'FUCN: requestStoragePermission | VAR: NONE | Storage Permission NOT Granted');
      return -1;
    }
  }

  void generatePDFFromLessonPlanData() async {
    dynamic lessonPlanSnapshot =
        await db.collection(widget.profCode).doc('Lesson Plan').get();
    if (lessonPlanSnapshot.exists) {
      Map<String, dynamic> completeLessonPlanData =
          lessonPlanSnapshot.data() as Map<String, dynamic>;

      print(
          'FUNC: generatePDFFromLessonPlanData | VAR: completeLessonPlanData | $completeLessonPlanData');

      if (await Permission.storage.isGranted) {
        print('Storage Permissions Already Granted');
        final pdfFile = await PDFGenerator.generate(
            widget.profCode, completeLessonPlanData);

        PDFOperator.openFile(pdfFile);
      } else {
        int returnCode = await requestStoragePermission();
        if (returnCode == 0) {
          print('Return Code 0. Permission Granted.');
          final pdfFile = await PDFGenerator.generate(
              widget.profCode, completeLessonPlanData);

          PDFOperator.openFile(pdfFile);
        } else if (returnCode == -1) {
          print('Return Code -1. Permission NOT Granted');
        }
      }

      print('Check2');
    } else {
      print('Document does not exist');
    }
  }

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
          'TIMETABLE',
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
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection(widget.profCode).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final timetable = snapshot.data?.docs;
                    List<Widget> timetableWidgets = [];
                    Map<String, List<LessonPlanButton>> tempBuffer = {};
                    receivedData.clear();
                    for (var everyDayTimetable in timetable!) {
                      String dayOfWeek = everyDayTimetable.id;
                      if (!workingDays.contains(dayOfWeek)) {
                        continue;
                      }
                      tempBuffer[dayOfWeek] = [];
                      for (var slot in everyDayTimetable['timetable']) {
                        String timeStart = slot['timeStart'];
                        String timeEnd = slot['timeEnd'];
                        String subjectName = slot['subjectName'];
                        String semester = slot['semester'];
                        String section = slot['section'];
                        tempBuffer[dayOfWeek]?.add(LessonPlanButton(
                            widget.profCode,
                            section,
                            semester,
                            subjectName,
                            timeStart,
                            timeEnd,
                            context));
                      }
                    }

                    for (String day in workingDays) {
                      timetableWidgets.add(DayWidget(day));
                      for (var timetableOfSlot in tempBuffer[day]!) {
                        timetableWidgets.add(timetableOfSlot);
                      }
                    }

                    if (firstData) {
                      firstData = false;
                      print('Variable firstData has been inverted!');
                    } else {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.info,
                          text: 'There has been an update in your time table!',
                        );
                      });
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ListView(
                        children: timetableWidgets,
                      ),
                    );
                  } else {
                    print('No data in snapshots.');
                    return const Text('No data in snapshots.');
                  }
                },
              ),
            ),
            const Divider(
              color: Colors.grey, // Color of the line
              thickness: 1, // Thickness of the line
              indent: 20, // Empty space to the leading edge of the divider.
              endIndent: 20, // Empty space to the trailing edge of the divider.
            ),
            RegistrationLoginButton(
              'Filter Vacancy Screen',
              () {
                Navigator.pushNamed(context, '/filtervacancy');
              },
            ),
            RegistrationLoginButton(
              'Push CSV To Firebase Firestore',
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PushCSVScreen(widget.profCode);
                }));
              },
            ),
            RegistrationLoginButton(
              'Generate Lesson Plan',
              () {
                generatePDFFromLessonPlanData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
