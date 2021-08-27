import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/adapters.dart';
import './config/story_brain.dart';
import 'resources/constants.dart';
import './config/config.dart';

// TODO: add recap and savedPages to hive
// TODO: add button for erasing ONLY recap (restart story)
// TODO: add choice-tracking feature
// TODO: tackle the story data, finally

StoryBrain storyBrain = StoryBrain();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox("preferences");
  await Hive.openBox("userSave");
  storyBrain.loadSavedGame();
  runApp(Thatcher());
}

class Thatcher extends StatefulWidget {
  const Thatcher({Key? key}) : super(key: key);

  @override
  _ThatcherState createState() => _ThatcherState();
}

class _ThatcherState extends State<Thatcher> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kThemeLight,
      darkTheme: kThemeDark,
      themeMode: currentTheme.getTheme() ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: kRoutes,
    );
  }
}
