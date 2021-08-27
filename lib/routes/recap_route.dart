import 'package:flutter/material.dart';
import '../config/story_brain.dart';
import '../resources/constants.dart';

StoryBrain storyBrain = StoryBrain();

// TODO: MAKE THIS THING WORK

class RecapRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: Column(
          children: [
            Expanded(
              child: PageView(
                children: [
                  // TODO: get recap indices and wire this up proper-like
                  Center(child: Container(child: Text('Testing One!'))),
                  Center(child: Container(child: Text('Testing Two!'))),
                  Center(child: Container(child: Text('Testing Three!'))),
                  Center(child: Container(child: Text('Testing Four!')))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TODO: wire these up to do actual things
                FloatingActionButton(
                  heroTag: 'btn1',
                  onPressed: () {
                    // TODO: FIX THIS
                  },
                ),
                FloatingActionButton(
                  heroTag: 'btn2',
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                )
              ],
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
