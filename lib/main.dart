import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/adapters.dart';
import './constants/story_brain.dart';
import './constants/constants.dart';
import './constants/config.dart';

StoryBrain storyBrain = StoryBrain();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox("preferences");
  await Hive.openBox("userSave");
  storyBrain.setRecap();
  runApp(Thatcher());
  print('main.dart has fired');
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
      themeMode: currentTheme.currentTheme(),
      initialRoute: '/',
      routes: kRoutes,
    );
  }
}
