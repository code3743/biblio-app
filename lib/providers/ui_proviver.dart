import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _index = 0;

  bool _saveCode = false;

  bool get saveCode => _saveCode;

  set saveCode(bool value) {
    _saveCode = value;
    notifyListeners();
  }

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }
}
