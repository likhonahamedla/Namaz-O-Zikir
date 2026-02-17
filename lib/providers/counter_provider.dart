import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;

  void incriment({required int maxCount}) {
    if (count >= maxCount) return;
    count++;
    notifyListeners();
  }

  void decrement() {
    if (count <= 0) return;
    count--;
    notifyListeners();
  }
}
