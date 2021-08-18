import 'package:flutter/material.dart';

// TODO incorporate Hive here to save data

class MyTheme with ChangeNotifier {
  static bool _isDark = true;
  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void setTheme(bool isDark) {
    _isDark = isDark;

    notifyListeners();
  }

  bool getTheme() {
    return _isDark;
  }
}

class UserHand with ChangeNotifier {
  static bool _isRightHanded = true;
  bool userDominantHand() {
    return _isRightHanded ? true : false;
  }

  void setUserHand(bool isRightHanded) {
    _isRightHanded = isRightHanded;
    notifyListeners();
  }

  bool getUserHand() {
    return _isRightHanded;
  }
}
