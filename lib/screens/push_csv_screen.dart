import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PushCSVScreen extends StatefulWidget {
  const PushCSVScreen({Key? key}) : super(key: key);

  @override
  State<PushCSVScreen> createState() => _PushCSVScreenState();
}

class _PushCSVScreenState extends State<PushCSVScreen> {
  List<List<dynamic>> csvContents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push CSV Screen'),
      ),
      body: SafeArea(
        child: TextButton(
          onPressed: () async {
            final rawData = await rootBundle.loadString('assets/UDA.csv');
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
            // DummyData().insertDummyDataInFirestoreV4('UDA', timetableObjects);
          },
          child: const Text('Insert From CSV'),
        ),
      ),
    );
  }
}
