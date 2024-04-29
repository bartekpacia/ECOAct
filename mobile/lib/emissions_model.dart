import 'package:flutter/widgets.dart';

class CarbonFootprintModel extends ChangeNotifier {
  int _carbonFootprint = 0;

  int get carbonFootprint => _carbonFootprint;

  void incrementCarbonFootprint([int value = 1]) {
    _carbonFootprint += value;
    notifyListeners();
  }

  void decrementCarbonFootprint([int value = 2]) {
    _carbonFootprint -= value;
    notifyListeners();
  }
}
