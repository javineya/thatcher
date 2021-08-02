import 'package:flutter/material.dart';
import '../constants/story_brain.dart';
import '../constants/constants.dart';

StoryBrain storyBrain = StoryBrain();

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
                  Center(
                      child: Container(
                          child: Text('Testing One!', style: kTextTitle))),
                  Center(
                      child: Container(
                          child: Text('Testing Two!', style: kTextTitle))),
                  Center(
                      child: Container(
                          child: Text('Testing Three!', style: kTextTitle))),
                  Center(
                      child: Container(
                          child: Text('Testing Four!', style: kTextTitle)))
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
                    storyBrain.getRecap();
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
