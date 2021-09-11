import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Box _prefsBox = Hive.box("preferences");
Box _userSave = Hive.box("userSave");

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

class UserSave {
  void setRecap(recap) {
    _userSave.put("recap", recap);
  }

  Set<int> getRecap() {
    return _userSave.get("recap").toSet();
  }

  void setLibrary(library) {
    _userSave.put("library", library);
  }

  Set<int> getLibrary() {
    return _userSave.get("library").toSet();
  }

  void setSituations(situations) {
    _userSave.put("situations", situations);
  }

  Set<String> getSituations() {
    return _userSave.get("situations").toSet();
  }
}
