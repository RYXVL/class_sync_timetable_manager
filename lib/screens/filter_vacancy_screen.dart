import 'package:class_sync_timetable_manager/dummy_data.dart';
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
              const Text('Start Time Slot: '),
              DropdownButton(
                value: startTimeSlot,
                items: dummyData.generateTimeSlotsMenuItems(),
                onChanged: (newValue) {
                  setState(() {
                    startTimeSlot = newValue;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const Text('End Time Slot: '),
              DropdownButton(
                value: endTimeSlot,
                items: dummyData.generateTimeSlotsMenuItems(),
                onChanged: (newValue) {
                  setState(() {
                    endTimeSlot = newValue;
                  });
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}
