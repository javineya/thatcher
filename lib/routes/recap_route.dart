import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config/story_brain.dart';
import '../config/config.dart';

StoryBrain storyBrain = StoryBrain();

class RecapRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                children: storyBrain.getRecapContents(),
              ),
            ),
            Row(
              mainAxisAlignment: userHand.getHand() == true
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
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
