import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/story_route.dart';
import '../pages/settings_route.dart';
import '../pages/recap_route.dart';
import '../pages/info_route.dart';

// ----------            ROUTES             ---------- //
Map<String, WidgetBuilder> kRoutes = {
  '/': (context) => StoryRoute(),
  '/settings': (context) => SettingsRoute(),
  '/recap': (context) => RecapRoute(),
  '/info': (context) => InfoRoute()
};

//region TEXT STYLES
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
  color: Colors.black,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontFamily: 'CrimsonText',
);
TextStyle kTextNarration = TextStyle(
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
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
  fontFamily: 'CrimsonText',
);
TextStyle kTextInfoBar = TextStyle(
    color: Colors.blueGrey, fontSize: 20, fontStyle: FontStyle.italic);
TextStyle kTextTerminal = TextStyle(
  fontSize: 22,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontFamily: 'Merriweather',
);
//endregion

//region SIZING STYLES
const kSpacingDrawer = EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0);
const kSizeDrawerIcon = 40.0;
//endregion

//region APP ColorScheme
// Dark Purple:                    242038
// Slate Blue:                     752ac1
// Middle Blue Purple:             8d86c9
// Lavender Grey:                  cac4ce
// Linen:                          f7ece1

Color kLightBG = Color(0xfff7ece1);
Color kLightText = Color(0xff242038);
Color kLightChoice = Color(0xff8d86c9);
Color kNeutralButton = Color(0xffbdbdbd);
Color kDarkBG = Color(0xff212121);
Color kDarkText = Color(0xfff7ece1);
Color kDarkChoice = Color(0xffcac4ce);

ThemeData kThemeLight =
    ThemeData(fontFamily: "CrimsonText", canvasColor: Color(0xfff7ece1));

ThemeData kThemeDark = ThemeData.dark().copyWith(
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'CrimsonText',
        bodyColor: kDarkText,
        displayColor: kDarkText,
      ),
  primaryTextTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'CrimsonText',
        bodyColor: kDarkText,
        displayColor: kDarkText,
      ),
  accentTextTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'CrimsonText',
        bodyColor: kDarkText,
        displayColor: kDarkText,
      ),
);
//endregion
