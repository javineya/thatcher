import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;
import '../constants/story_brain.dart';
import '../constants/constants.dart';

class SettingsRoute extends StatefulWidget {
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  StoryBrain storyBrain = StoryBrain();
  late Box prefsBox;
  bool _rightHandedUser = true;
  bool _darkMode = true;
  List<bool> _isSelectedHand = [false, false];
  List<bool> _isSelectedMode = [false, false];

  //region  INITIAL SETTINGS
  void initState() {
    super.initState();
    prefsBox = Hive.box("preferences");
    _getInitPrefs();
    print('settings_route has fired');
  }

  // these three methods are needed so the active toggle button matches the
  // user's saved setting
  void _getInitPrefs() async {
    final handPrefs = await prefsBox.get("rightHandedUser") ?? true;
    final modePrefs = await prefsBox.get("darkMode") ?? true;

    setState(() {
      _rightHandedUser = handPrefs;
      _darkMode = modePrefs;
    });
    _setIsSelectedHand();
    _setIsSelectedMode();
  }

  void _setIsSelectedHand() {
    _rightHandedUser == true
        ? _isSelectedHand = [false, true]
        : _isSelectedHand = [true, false];
  }

  void _setIsSelectedMode() {
    _darkMode == true
        ? _isSelectedMode = [false, true]
        : _isSelectedMode = [true, false];
  }

  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkMode == true ? kDarkBG : kLightBG,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text('Choose Dominant Hand',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: _darkMode == true ? kDarkText : kLightText)),
            ),
            ToggleButtons(
              color: kNeutralButton,
              fillColor: Colors.transparent,
              highlightColor: Colors.transparent,
              renderBorder: false,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: FaIcon(FontAwesomeIcons.solidHandPaper, size: 90.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(FontAwesomeIcons.solidHandPaper, size: 90.0),
                ),
              ],
              onPressed: (int index) {
                setState(
                  () {
                    for (int buttonIndex = 0;
                        buttonIndex < _isSelectedHand.length;
                        buttonIndex++) {
                      buttonIndex == index
                          ? _isSelectedHand[buttonIndex] = true
                          : _isSelectedHand[buttonIndex] = false;
                    }
                    _isSelectedHand[0] == true
                        ? storyBrain.setUserRightHanded(false)
                        : storyBrain.setUserRightHanded(true);
                  },
                );
              },
              isSelected: _isSelectedHand,
            ),
            Container(
              child: Text(
                  'WARNING: Dark/Light change is an example. '
                  '\n\nTo apply changes, app must be restarted.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: _darkMode == true ? kDarkText : kLightText)),
            ),
            ToggleButtons(
              color: kNeutralButton,
              fillColor: Colors.transparent,
              highlightColor: Colors.transparent,
              renderBorder: false,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(FontAwesomeIcons.sun, size: 90.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(FontAwesomeIcons.moon, size: 90.0),
                ),
              ],
              onPressed: (int index) {
                setState(
                  () {
                    for (int buttonIndex = 0;
                        buttonIndex < _isSelectedMode.length;
                        buttonIndex++) {
                      buttonIndex == index
                          ? _isSelectedMode[buttonIndex] = true
                          : _isSelectedMode[buttonIndex] = false;
                    }
                    if (_isSelectedMode[0] == true) {
                      storyBrain.setUserMode(false);
                      _darkMode = false;
                    } else {
                      storyBrain.setUserMode(true);
                      _darkMode = true;
                    }
                  },
                );
              },
              isSelected: _isSelectedMode,
            ),
            FloatingActionButton(
                child: Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
