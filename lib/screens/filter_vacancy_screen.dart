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
    FirebaseFirestore db = FirebaseFirestore.instance;
    dynamic profCodesCollectionSnapshot =
        await db.collection('PROFCODES').get();
    for (var profCodeDoc in profCodesCollectionSnapshot.docs) {
      profCodeList.add(profCodeDoc['code']);
    }
    print(profCodeList);
    return profCodeList;
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
          'Filter Vacancy',
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
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
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
                    Map<String, dynamic>? data =
                        documentSnapshot.data() as Map<String, dynamic>?;
                    var completeTimetable = data?['timetable'];
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
