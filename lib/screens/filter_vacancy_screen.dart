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
  // String resultsText = '';

  List<Text> generateListOfResults() {
    print('ListGen Res: $filteredResults');
    List<Text> results = [];
    if (filteredResults.length == 0) {
      results.add(const Text(
        'No faculty available!',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: 'DMSerifDisplay',
        ),
      ));
      return results;
    }
    // results.add(const Text('Results: -'));
    for (String result in filteredResults) {
      results.add(Text(
        result,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: 'DMSerifDisplay',
        ),
      ));
    }
    return results;
  }

  Future<List<String>> getProdCodeList() async {
    List<String> profCodeList = [];
    // String? userEmail = FirebaseAuth.instance.currentUser?.email;
    // print(userEmail);
    FirebaseFirestore db = FirebaseFirestore.instance;
    dynamic profCodesCollectionSnapshot =
        await db.collection('PROFCODES').get();
    for (var profCodeDoc in profCodesCollectionSnapshot.docs) {
      profCodeList.add(profCodeDoc['code']);
    }
    print(profCodeList);
    // if (profCodeSnapshot.exists) {
    //   Map<String, dynamic> data =
    //       profCodeSnapshot.data() as Map<String, dynamic>;
    //   String profCode = data['code'];
    //   print(profCode);
    //   return profCode;
    // } else {
    //   print('No such document exists!');
    //   return 'ERROR';
    // }
    return profCodeList;
  }

  @override
  Widget build(BuildContext context) {
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
          'Filter Vacancy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontFamily: 'Gladifilthefte',
          ),
        ),
        // title: const Text(
        //   'Filter Vacancy Screen',
        // ),
      ),
      body: SafeArea(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Day of Week: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'DMSerifDisplay',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: initialDay,
                      items: dummyData.generateDaysInAWeekMenuItems(),
                      onChanged: (newValue) {
                        setState(() {
                          filteredResults.clear();
                          initialDay = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Slot: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'DMSerifDisplay',
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: initialSlot,
                    items: dummyData.generateTimeRangeMenuItems(),
                    onChanged: (newValue) {
                      setState(() {
                        filteredResults.clear();
                        initialSlot = newValue;
                        // List sep = newValue.split('-');
                        // print('start-${sep[0]} | end-${sep[1]}');
                      });
                    },
                  ),
                ),
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
          SizedBox(
            height: 30,
          ),
          RegistrationLoginButton(
            'Search',
            () async {
              filteredResults.clear();
              List<String> profCodeList = await getProdCodeList();
              List startAndStopSlot = initialSlot.split('-');
              for (String profCode in profCodeList) {
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
                    print('Profs free: $filteredResults');
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
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 12.0),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black, width: 2.0),
              //   borderRadius: BorderRadius.circular(8.0),
              // ),
              child: ListView(
                children: generateListOfResults(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
