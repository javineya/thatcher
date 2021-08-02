import 'package:flutter/material.dart';
import '../constants/story_brain.dart';
import '../constants/constants.dart';

StoryBrain storyBrain = StoryBrain();

class SettingsRoute extends StatefulWidget {
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  final List<bool> _isSelected = [false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: ToggleButtons(
                children: [
                  Text('Left', style: kTextBody),
                  Text('Right', style: kTextBody),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < _isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        _isSelected[buttonIndex] = true;
                      } else {
                        _isSelected[buttonIndex] = false;
                      }
                    }
                    _isSelected[0] == true
                        ? storyBrain.setUserRightHanded(false)
                        : storyBrain.setUserRightHanded(true);
                  });
                },
                isSelected: _isSelected,
              ),
            ),
            Container(
              alignment: storyBrain.getUserRightHanded() == true
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text('TESTING!', style: kTextBody),
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
