


import 'package:flutter/material.dart';

class IncremenetCounter extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  incCounter() {
    _value++;
    notifyListeners();
  }
}