import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LangModel extends ChangeNotifier {
  String langCode;

  void changeLangTo(String code) async {
    langCode = code;
    notifyListeners();
  }
}
