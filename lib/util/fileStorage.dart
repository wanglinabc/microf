import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileUtil {
  static Directory _directory;

  void init() async {
    if (_directory == null) {
      _directory = await getApplicationDocumentsDirectory();
    }
  }
}
