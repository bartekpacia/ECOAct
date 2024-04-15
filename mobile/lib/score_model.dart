import 'package:flutter/widgets.dart';

class ScoreModel extends ChangeNotifier {
  int _state = 0;
  int get state => _state;

  void increment([int value = 1]) {
    _state += value;
    notifyListeners();
  }

  void decrement([int value = 2]) {
    _state -= value;
    notifyListeners();
  }
}
