import 'dart:io';

import 'package:class_sync_timetable_manager/custom_widgets/registration_login_button.dart';
import 'package:class_sync_timetable_manager/dummy_data.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PushCSVScreen extends StatefulWidget {
  String profCode;
  PushCSVScreen(this.profCode);

  @override
  State<PushCSVScreen> createState() => _PushCSVScreenState();
}

class _PushCSVScreenState extends State<PushCSVScreen> {
  List<List<dynamic>> csvContents = [];

  String filePath = "";
  String daywiseSectionSemester = "";

  void copyFile(sourcePath, destinationPath) async {
    try {
      File sourceFile = File(sourcePath);
      print('Check1');
      if (await sourceFile.exists()) {
        print("Check 3");
        await sourceFile.copy(destinationPath);
        print('Check2');
        print('File copied successfully.');
      } else {
        print('Source file does not exist.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // allowedExtensions: ["csv"],
        );

    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      File mainfile = File(result!.files.single.path!);
      setState(() {
        filePath = mainfile.path;
      });

      // copyFile(filePath, "assets");
    } else {
      print("Error picking up the file!");
    }
  }

  @override
  void initState() {
    print('Prof code in push csv screen: ${widget.profCode}');
    // TODO: implement initState
    super.initState();
  }

  dynamic extractDaywiseInformation() {
    Map daywiseInfo = {};
    if (daywiseSectionSemester == '') {
      throw Exception(
          'CUSTOM_THROWN_ERROR: Daywise Section Semester Information NOT Given!');
    } else {
      // print(
      //     'FUNC: extractDaywiseInformation() | VAR: daywiseSectionSemester | $daywiseSectionSemester');
      // daywiseSectionSemester =
      //     'Monday-DBSL(B2):Spring:A;DBS:Fall:B|Tuesday-DBS:Fall:C|Thursday-DBS:Winter:C|Friday-DBS:Fall:D|Saturday-DBSL(B1):Fall:E;DBSL(B1):Spring:F';
      List daywiseInfoList = daywiseSectionSemester.split('|');
      for (var info in daywiseInfoList) {
        String day = info.split('-')[0];
        String daysContent = info.split('-')[1];
        List subjectDetails = daysContent.split(';');
        for (var subjectInfo in subjectDetails) {
          String subjectName = subjectInfo.split(':')[0];
          String semester = subjectInfo.split(':')[1];
          String section = subjectInfo.split(':')[2];
          if (!daywiseInfo.containsKey(day)) {
            daywiseInfo[day] = {};
          }
          if (!daywiseInfo[day].containsKey(subjectName)) {
            daywiseInfo[day][subjectName] = {};
          }
          daywiseInfo[day][subjectName] = {
            'semester': semester,
            'section': section,
          };
        }
      }
    }
    return daywiseInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'PUSH CSV FILE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontFamily: 'Gladifilthefte',
          ),
        ),
        backgroundColor: Color(0xFF141319),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RegistrationLoginButton(
                'Pick CSV File',
                () {
                  filePicker();
                },
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Please enter section (eg: A, B, ...) and semester (eg: Fall, Spring, Summer or Winter) for each subject of each day in the following given sample format!',
                    style: TextStyle(
                      // color: Colors.blueGrey,
                      color: Color(0xFF141319),
                      fontSize: 15.0,
                      fontFamily: 'DMSerifDisplay',
                    ),
                  ),
                  const Text(
                    'Monday-SubjectName1:Semester1:Section1;SubjectName2:Semester2:Section2;...|Tuesday-SubjectName1:Semester1:Section1;...|...',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15.0,
                      fontFamily: 'DMSerifDisplay',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: daywiseSectionSemester,
                      onChanged: (newValue) {
                        setState(() {
                          daywiseSectionSemester = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Color(0xFF141319),
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5.0),
                    child: TextButton(
                      onPressed: () async {
                        filePath = filePath;
                        final rawData = await File(filePath).readAsString();
                        // final rawData = await rootBundle.loadString(filePath);
                        csvContents =
                            const CsvToListConverter().convert(rawData);
                        List<dynamic> timeSlots =
                            csvContents[0].sublist(1, csvContents[0].length);
                        dynamic timetableObjects = {};
                        dynamic extractedInfo = extractDaywiseInformation();
                        // print(
                        //     'FUNC: extractDaywiseInformation() | $extractedInfo');
                        for (int i = 1; i < csvContents.length; i++) {
                          String dayOfWeek = csvContents[i][0];
                          List<dynamic> daysSchedule =
                              csvContents[i].sublist(1, csvContents[i].length);
                          dynamic daysTimetable = [];
                          // print('DAYSSCHEDULE: $daysSchedule');
                          for (int j = 0; j < daysSchedule.length; j++) {
                            String timeStart =
                                timeSlots[j].split('-')[0].trim();
                            String timeEnd = timeSlots[j].split('-')[1].trim();
                            // print('SUBJECTNAME: ${daysSchedule[j]}');
                            // print(
                            //     'EXTRACTION: ${extractedInfo[dayOfWeek][daysSchedule[j]]}');
                            // print(
                            //     'SEMESTER: ${extractedInfo[dayOfWeek][daysSchedule[j]]['semester']}');
                            // print(
                            //     'SECTION: ${extractedInfo[dayOfWeek][daysSchedule[j]]['section']}');
                            daysTimetable.add({
                              'timeStart': timeStart,
                              'timeEnd': timeEnd,
                              'subjectName': daysSchedule[j],
                              'semester': daysSchedule[j] == ''
                                  ? ''
                                  : extractedInfo[dayOfWeek][daysSchedule[j]]
                                      ['semester'],
                              'section': daysSchedule[j] == ''
                                  ? ''
                                  : extractedInfo[dayOfWeek][daysSchedule[j]]
                                      ['section'],
                            });
                          }
                          timetableObjects[dayOfWeek] = daysTimetable;
                        }
                        DummyData().insertDummyDataInFirestoreV4(
                            'PUSHCSV_TEST2', timetableObjects);
                      },
                      child: const Text(
                        'Insert From CSV',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              // Text(filePath),
            ],
          ),
        ),
      ),
    );
  }
}
