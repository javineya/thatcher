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
  List<bool> _isSelected = [false, false];

  //region  INITIAL SETTINGS
  void initState() {
    super.initState();
    prefsBox = Hive.box("preferences");
    _getInitPrefs();
  }

  void _getInitPrefs() async {
    final prefs = await prefsBox.get("rightHandedUser") ?? true;
    setState(() {
      _rightHandedUser = prefs;
    });
    _setIsSelected();
  }

  void _setIsSelected() {
    _rightHandedUser == true
        ? _isSelected = [false, true]
        : _isSelected = [true, false];
  }
  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ToggleButtons(
              fillColor: Colors.transparent,
              highlightColor: Colors.transparent,
              renderBorder: false,
              children: [
                // TODO: change these to icons later
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
                        buttonIndex < _isSelected.length;
                        buttonIndex++) {
                      buttonIndex == index
                          ? _isSelected[buttonIndex] = true
                          : _isSelected[buttonIndex] = false;
                    }
                    _isSelected[0] == true
                        ? storyBrain.setUserRightHanded(false)
                        : storyBrain.setUserRightHanded(true);
                  },
                );
              },
              isSelected: _isSelected,
            ),
            Container(
              child: Text(
                'This will flip the interface to be more '
                'comfortable for left-handed users.',
                style: kTextBody,
                textAlign: TextAlign.center,
              ),
            ),
            FloatingActionButton(
                child: Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                })
          ],
        ),
      ),
    );
  }
}
