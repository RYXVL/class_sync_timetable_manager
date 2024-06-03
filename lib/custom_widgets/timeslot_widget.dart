import 'package:flutter/material.dart';

class TimeslotWidget extends StatelessWidget {
  String timeStart;
  String timeEnd;
  String semester;
  String section;
  String subjectName;

  TimeslotWidget(this.timeStart, this.timeEnd, this.semester, this.section,
      this.subjectName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Colors.blueGrey,
        shape:
            BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 62,
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      '$timeStart-$timeEnd',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color:
                          section == "" ? Color(0xFFA1DD70) : Color(0xFFCAF4FF),
                      child: Center(child: Text(section)),
                    ),
                    Container(
                      color: subjectName == ""
                          ? Color(0xFFA1DD70)
                          : Color(0xFFFFF9D0),
                      child: Center(
                          child:
                              Text(subjectName == "" ? 'FREE' : subjectName)),
                    ),
                    Container(
                      color: semester == ""
                          ? Color(0xFFA1DD70)
                          : Color(0xFFFEAE6F),
                      child: Center(child: Text(semester)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
