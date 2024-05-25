import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  // const DayWidget({Key? key}) : super(key: key);
  String day;
  DayWidget(this.day);

  Map<String, Color> daysContainerColor = {
    "Monday": Color(0xFFFF5733),
    "Tuesday": Color(0xFF33FF57),
    "Wednesday": Color(0xFF3357FF),
    "Thursday": Color(0xFFFF33A8),
    "Friday": Color(0xFF33FFF5),
    "Saturday": Color(0xFFFFBD33),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: daysContainerColor[day],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(0.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        width: double.infinity,
        // padding: EdgeInsets.symmetric(horizontal: 8),
        // color: daysContainerColor[day],
        child: Center(
          child: Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontFamily: 'norwester',
            ),
          ),
        ),
      ),
    );
  }
}
