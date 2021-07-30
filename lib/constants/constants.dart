import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/story_route.dart';
import '../pages/settings_route.dart';
import '../pages/recap_route.dart';

// ----------            ROUTES             ---------- //
Map<String, WidgetBuilder> kRoutes = {
  '/': (context) => StoryRoute(),
  '/settings': (context) => SettingsRoute(),
  '/recap': (context) => RecapRoute()
};

// ----------         TEXT STYLES           ---------- //
TextStyle kTextAppTitle = TextStyle(
  fontFamily: 'CrimsonText',
  fontSize: 60,
);
TextStyle kTextTitle = TextStyle(
  fontSize: 40,
  fontFamily: 'CrimsonText',
);
TextStyle kTextBody = TextStyle(
  fontSize: 22,
  color: Colors.white,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontFamily: 'CrimsonText',
);
TextStyle kTextNarration = TextStyle(
  color: Colors.white,
  fontSize: 23,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.normal,
  fontFamily: 'CrimsonText',
);
TextStyle kTextChoice = TextStyle(
  fontSize: 22,
  color: Colors.cyan[300],
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
  fontFamily: 'CrimsonText',
);
TextStyle kTextLoud = TextStyle(
  fontSize: 25,
  color: Colors.white,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
  fontFamily: 'CrimsonText',
);
TextStyle kTextInfoBar = TextStyle(
    color: Colors.blueGrey, fontSize: 20, fontStyle: FontStyle.italic);
TextStyle kTextTerminal = TextStyle(
  fontSize: 22,
  color: Colors.white,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontFamily: 'Merriweather',
);

// ----------      SPACING & SIZING         ---------- //
const kSpacingDrawer = EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0);
const kSizeDrawerIcon = 40.0;

// ----------           COLORS              ---------- //
