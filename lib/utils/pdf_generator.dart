import 'dart:io';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'pdf_operator.dart';

class PDFGenerator {
  static Future<File> generate(String profCode, dynamic lessonPlan) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(profCode),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle('LESSON PLAN'),
        buildInvoice(lessonPlan),
        Divider(),
      ],
    ));
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd-hh-mm-ss').format(now);
    return PDFOperator().saveDocument('lesson_plan-$formattedDate.pdf', pdf);
  }

  static Widget buildInvoice(dynamic lessonPlan) {
    final headers = [
      'Date',
      'Timeslot',
      'Semester',
      'Section',
      'Subject Name',
      'Contents Covered'
    ];

    List<List<dynamic>> lessonData = [];

    lessonPlan.forEach((date, slotsData) {
      slotsData.forEach((timeslot, data) {
        String mainData = data["data"];
        String section = data["section"];
        String semester = data["semester"];
        String subjectName = data["subjectName"];
        lessonData
            .add([date, timeslot, semester, section, subjectName, mainData]);
      });
    });

    return Table.fromTextArray(
      headers: headers,
      data: lessonData,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }

  static Widget buildTitle(String documentTitle) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            documentTitle,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      );

  static Widget buildHeader(String profCode) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(profCode),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
        ],
      );
}
