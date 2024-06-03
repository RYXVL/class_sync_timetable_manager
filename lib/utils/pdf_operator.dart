import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class PDFOperator {
  Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.manageExternalStorage.request();
      return status.isGranted;
    } else {
      final status = await Permission.storage.request();
      return status.isGranted;
    }
  }

  Future<File> saveDocument(
    String name,
    Document pdf,
  ) async {
    final bytes = await pdf.save();
    if (await requestStoragePermission()) {
      final dir = await getExternalStorageDirectory();
      final file = File('${dir?.path}/$name');

      await file.writeAsBytes(bytes);

      return file;
    } else {
      throw Exception('Storage permission not granted');
    }
  }

  static void openFile(File file) async {
    final url = file.path;
    print('FILEPATH: ${file.path}');
    if (await file.exists()) {
      try {
        final result = await OpenFile.open(url);
        print('Open result: ${result.message}');
      } catch (e) {
        print('EXCEPTION: $e');
      }
    } else {
      print('File does not exist');
    }
  }
}
