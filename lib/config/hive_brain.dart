import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Box _prefsBox = Hive.box("preferences");
Box _userSave = Hive.box("userSave");

// TODO fix the recap, since you broke it...
// TODO fix the full reset button, since you broke it, too...

class MyTheme with ChangeNotifier {
  void setTheme(bool isDark) {
    _prefsBox.put("darkMode", isDark);
    notifyListeners();
  }

  bool getTheme() {
    return _prefsBox.get("darkMode") ?? false;
  }
}

class UserHand with ChangeNotifier {
  void setHand(bool isRightHanded) {
    _prefsBox.put("rightHandedUser", isRightHanded);
    notifyListeners();
  }

  bool getHand() {
    return _prefsBox.get("rightHandedUser") ?? true;
  }
}

class UserSave {
  void setRecap(recap) {
    _userSave.put("recap", recap);
  }

  Set<int> getRecap() {
    List<int> recap = _userSave.get("recap") ?? [0];
    return recap.toSet();
  }

  void setLibrary(library) {
    _userSave.put("library", library);
  }

  Set<int> getLibrary() {
    List<int> library = _userSave.get("library") ?? [0];
    return library.toSet();
  }

  void setSituations(situations) {
    _userSave.put("situations", situations);
  }

  Set<String> getSituations() {
    List<String> situations = _userSave.get("situations") ?? [];
    return situations.toSet();
  }

  void resetAll() {
    print('resetAll fired!');
    _userSave.put("situations", []);
    print('Situations: ${_userSave.get("situations")}');
    _userSave.put("recap", [0]);
    print('Recap: ${_userSave.get("recap")}');
    _userSave.put("library", [0]);
    print('Library: ${_userSave.get("library")}');
  }
}
