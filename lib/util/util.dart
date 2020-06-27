import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Util {
  static Future<File> getFile(String textFileName) async {
    final directory = await getTemporaryDirectory();
    return File('${directory.path}/$textFileName.txt');
  }

  static Future<File> writeToFile(
      String textFileName, String jsonString) async {
    final file = await getFile(textFileName);
    return file.writeAsString(jsonString);
  }

  static Future<String> readFromFile(String textFileName) async {
    try {
      final file = await getFile(textFileName);
      return await file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
