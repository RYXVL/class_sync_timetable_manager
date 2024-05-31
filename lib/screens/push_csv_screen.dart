import 'dart:io';

import 'package:class_sync_timetable_manager/custom_widgets/registration_login_button.dart';
import 'package:class_sync_timetable_manager/dummy_data.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PushCSVScreen extends StatefulWidget {
  // const PushCSVScreen({Key? key}) : super(key: key);
  String profCode;
  PushCSVScreen(this.profCode);

  @override
  State<PushCSVScreen> createState() => _PushCSVScreenState();
}

class _PushCSVScreenState extends State<PushCSVScreen> {
  List<List<dynamic>> csvContents = [];

  String filePath = "";

  void copyFile(sourcePath, destinationPath) async {
    // Define the source and destination paths
    // String sourcePath = '/path/to/source/file.txt'; // Replace with your source file path
    // String destinationPath = '/path/to/destination/file.txt'; // Replace with your destination file path

    try {
      // Create a File object for the source file
      File sourceFile = File(sourcePath);
      print('Check1');

      // Check if the source file exists
      if (await sourceFile.exists()) {
        // Copy the file contents
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
      // /sdcard/Documents/UDA.csv
      File mainfile = File(result!.files.single.path!);
      setState(() {
        filePath = mainfile.path;
      });

      copyFile(filePath, "assets");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'PUSH CSV FILE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontFamily: 'Gladifilthefte',
          ),
        ),
        backgroundColor: Color(0xFF141319),
        // title: const Text('Push CSV Screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RegistrationLoginButton(
                'Pick CSV File',
                () {
                  filePicker();
                },
              ),
              // MaterialButton(
              //   onPressed: () {
              //     filePicker();
              //   },
              //   child: Text('Pick CSV File'),
              // ),
              Material(
                color: Color(0xFF141319),
                elevation: 5,
                borderRadius: BorderRadius.circular(5.0),
                child: TextButton(
                  // style: ButtonStyle(
                  //   elevation: 5 as MaterialStateProperty<double>,
                  //   shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(5))
                  //       as MaterialStateProperty<OutlinedBorder>,
                  //   backgroundColor:
                  //       Color(0xFF141319) as MaterialStateProperty<Color>,
                  // ),
                  onPressed: () async {
                    filePath = "/storage/emulated/0/Documents/UDA.csv";
                    final rawData = await rootBundle.loadString(filePath);
                    csvContents = const CsvToListConverter().convert(rawData);
                    List<dynamic> timeSlots =
                        csvContents[0].sublist(1, csvContents[0].length);
                    // print(timeSlots);
                    dynamic timetableObjects = {};
                    for (int i = 1; i < csvContents.length; i++) {
                      String dayOfWeek = csvContents[i][0];
                      List<dynamic> daysSchedule =
                          csvContents[i].sublist(1, csvContents[i].length);
                      // if (i == 1) {
                      dynamic daysTimetable = [];
                      for (int j = 0; j < daysSchedule.length; j++) {
                        String timeStart = timeSlots[j].split('-')[0].trim();
                        String timeEnd = timeSlots[j].split('-')[1].trim();
                        daysTimetable.add({
                          'timeStart': timeStart,
                          'timeEnd': timeEnd,
                          'subjectName': daysSchedule[j]
                        });
                      }
                      timetableObjects[dayOfWeek] = daysTimetable;
                      // }
                    }
                    DummyData().insertDummyDataInFirestoreV4(
                        widget.profCode, timetableObjects);
                  },
                  child: const Text(
                    'Insert From CSV',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Text(filePath),
            ],
          ),
        ),
      ),
    );
  }
}
