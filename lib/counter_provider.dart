import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int num = 0;

  void addNum() {
    num++;
    notifyListeners();
  }
}
