import 'package:flutter/material.dart';

import '../dummy_data.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  DummyData dummyData = DummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable Screen'),
      ),
      body: SafeArea(
        child: ListView(
          children: dummyData.generateWidgetsForDummyData(),
        ),
      ),
    );
  }
}
