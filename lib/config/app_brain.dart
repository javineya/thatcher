import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

// TODO incorporate Hive here to save database
Box _prefsBox = Hive.box("preferences");

class MyTheme with ChangeNotifier {
  void setTheme(bool isDark) {
    _prefsBox.put("darkMode", isDark);
    notifyListeners();
  }

  bool getTheme() {
    return _prefsBox.get("darkMode");
  }
}

class UserHand with ChangeNotifier {
  void setHand(bool isRightHanded) {
    _prefsBox.put("rightHandedUser", isRightHanded);
    notifyListeners();
  }

  bool getHand() {
    return _prefsBox.get("rightHandedUser");
  }
}
