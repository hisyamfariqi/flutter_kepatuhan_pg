import 'package:flutter/cupertino.dart';
import 'package:flutter_kepatuhan_pg/choices.dart';

class SingleNotifier extends ChangeNotifier {
  String _currentChoice = choice1[0];
  SingleNotifier();

  String get currentChoice => _currentChoice;

  updateChoice(String value) {
    if (value != _currentChoice) {
      _currentChoice = value;
      notifyListeners();
    }
  }
}
