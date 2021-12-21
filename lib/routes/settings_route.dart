import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;
import '../config/story_brain.dart';
import '../constants/constants.dart';
import '../config/config.dart';

class SettingsRoute extends StatefulWidget {
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  StoryBrain storyBrain = StoryBrain();
  bool _rightHandedUser = true;
  bool _darkMode = true;
  List<bool> _isSelectedHand = [false, false];
  List<bool> _isSelectedMode = [false, false];

  //region  INITIAL SETTINGS
  void initState() {
    super.initState();
    _getInitPrefs();
    userHand.addListener(() {
      if (mounted) {
        setState(() {
          _rightHandedUser = userHand.getHand();
        });
      }
    });
  }

  void _getInitPrefs() async {
    _rightHandedUser = userHand.getHand();
    _darkMode = currentTheme.getTheme();

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
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 50),
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
                        ? userHand.setHand(false)
                        : userHand.setHand(true);
                  },
                );
              },
              isSelected: _isSelectedHand,
            ), // UserHand
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
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _isSelectedMode.length;
                      buttonIndex++) {
                    buttonIndex == index
                        ? _isSelectedMode[buttonIndex] = true
                        : _isSelectedMode[buttonIndex] = false;
                  }
                  _isSelectedMode[0] == true
                      ? currentTheme.setTheme(false)
                      : currentTheme.setTheme(true);
                });
              },
              isSelected: _isSelectedMode,
            ), // CurrentTheme
            Row(
              mainAxisAlignment: _rightHandedUser == true
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                SizedBox(width: 40),
                TextButton(
                    child: FaIcon(FontAwesomeIcons.arrowLeft, size: 60),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(width: 40),
              ],
            )
          ],
        ),
      ),
    );
  }
}
