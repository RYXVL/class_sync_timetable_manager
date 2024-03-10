import 'package:class_sync_timetable_manager/custom_widgets/registration_login_button.dart';
import 'package:class_sync_timetable_manager/dummy_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FilterVacancyScreen extends StatefulWidget {
  const FilterVacancyScreen({Key? key}) : super(key: key);

  @override
  State<FilterVacancyScreen> createState() => _FilterVacancyScreenState();
}

class _FilterVacancyScreenState extends State<FilterVacancyScreen> {
  DummyData dummyData = DummyData();
  String initialProfCode = DummyData.profCodes[0];
  String startTimeSlot = DummyData.times[0];
  String endTimeSlot = DummyData.times[0];
  String initialDay = DummyData.daysInAWeek[0];
  String initialSlot = DummyData.timeRange[0];
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<String> filteredResults = [];

  List<Text> generateListOfResults() {
    List<Text> results = [];
    // results.add(const Text('Results: -'));
    for (String result in filteredResults) {
      results.add(Text(result));
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter Vacancy Screen',
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          // Row(
          //   children: [
          //     const Text('Professor Code: '),
          //     DropdownButton(
          //       value: initialProfCode,
          //       items: dummyData.generateProfCodesMenuItems(),
          //       onChanged: (newValue) {
          //         setState(() {
          //           initialProfCode = newValue;
          //         });
          //       },
          //     ),
          //   ],
          // ),
          Row(
            children: [
              const Text('Day of Week: '),
              DropdownButton(
                value: initialDay,
                items: dummyData.generateDaysInAWeekMenuItems(),
                onChanged: (newValue) {
                  setState(() {
                    initialDay = newValue;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const Text('Slot: '),
              DropdownButton(
                value: initialSlot,
                items: dummyData.generateTimeRangeMenuItems(),
                onChanged: (newValue) {
                  setState(() {
                    initialSlot = newValue;
                    List sep = newValue.split('-');
                    print('start-${sep[0]} | end-${sep[1]}');
                  });
                },
              ),
            ],
          ),
          // Row(
          //   children: [
          //     const Text('Start Time Slot: '),
          //     DropdownButton(
          //       value: startTimeSlot,
          //       items: dummyData.generateTimeSlotsMenuItems(),
          //       onChanged: (newValue) {
          //         setState(() {
          //           startTimeSlot = newValue;
          //         });
          //       },
          //     ),
          //   ],
          // ),
          // Row(
          //   children: [
          //     const Text('End Time Slot: '),
          //     DropdownButton(
          //       value: endTimeSlot,
          //       items: dummyData.generateTimeSlotsMenuItems(),
          //       onChanged: (newValue) {
          //         setState(() {
          //           endTimeSlot = newValue;
          //         });
          //       },
          //     ),
          //   ],
          // )
          RegistrationLoginButton(
            'Search',
            () async {
              filteredResults.clear();
              List startAndStopSlot = initialSlot.split('-');
              for (String profCode in DummyData.profCodes) {
                var doc = db.collection(profCode).doc(initialDay);
                doc.get().then((DocumentSnapshot documentSnapshot) {
                  if (documentSnapshot.exists) {
                    // Document exists, access its data
                    Map<String, dynamic>? data =
                        documentSnapshot.data() as Map<String, dynamic>?;
                    // var data = documentSnapshot.data();
                    var completeTimetable = data?['timetable'];
                    // print(data?['timetable']);
                    for (var timetable in completeTimetable) {
                      if (timetable['timeStart'] == startAndStopSlot[0] &&
                          timetable['timeStart'] == startAndStopSlot[0] &&
                          timetable['section'] == '' &&
                          timetable['semester'] == '' &&
                          timetable['subjectName'] == '') {
                        print(timetable);
                        setState(() {
                          filteredResults.add(profCode);
                        });

                        break;
                      }
                    }
                    print(filteredResults);
                  } else {
                    print('Document does not exist');
                  }
                }).catchError((error) {
                  print('Failed to fetch document: $error');
                });
              }
            },
          ),
          Expanded(
            child: ListView(
              children: generateListOfResults(),
            ),
          ),
        ],
      )),
    );
  }
}
