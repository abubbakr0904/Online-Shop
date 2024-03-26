import 'package:flutter/foundation.dart';

class TabViewModel extends ChangeNotifier {
  int _activeIndex = 0;

  int get getIndex => _activeIndex;

  void changeIndex(int newIndex) {
    _activeIndex = newIndex;
    notifyListeners();
  }
}