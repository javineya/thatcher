import 'package:flutter/material.dart';
import 'story_display.dart';

void main() => runApp(Thatcher());

class Thatcher extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'CrimsonText'),
      home: StoryPage(),
    );
  }
}
