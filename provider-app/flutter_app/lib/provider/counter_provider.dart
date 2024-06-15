import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  double _counter = 0.0;

  double get counter => _counter;

  void increment() {
    _counter = _counter + 1;
    notifyListeners();
  }

  void decrement() {
    _counter = _counter - 1;
    notifyListeners();
  }

  void incrementWithValue(double value) {
    _counter = _counter + value;

    notifyListeners();
  }

  void decrementWithValue(double value) {
    _counter = _counter - value;

    notifyListeners();
  }
}
