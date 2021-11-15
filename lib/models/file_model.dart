
import 'package:flutter/foundation.dart';

class FileModel extends ChangeNotifier {
  Uri? fileUri;
  String? get filename => fileUri?.path.split("/").last;

  void changeUri(Uri uri) {
    fileUri = uri;
    notifyListeners();
  }

  void removeUri() {
    fileUri = null;
    notifyListeners();
  }
}