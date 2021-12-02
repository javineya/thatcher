import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes/story_route.dart';
import '../routes/settings_route.dart';
import '../routes/recap_route.dart';
import '../routes/info_route.dart';

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
// TODO: add color variance for chosen/unchosen choices
TextStyle kTextChosen = TextStyle(
  fontSize: 26,
  color: Colors.red,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
  fontFamily: 'CrimsonText',
);
TextStyle kTextUnchosen = TextStyle(
  fontSize: 26,
  color: Colors.blue,
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
TextStyle kTextTerminalTitle = TextStyle(
  fontSize: 24,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontFamily: 'Merriweather',
);
TextStyle kTextTerminal = TextStyle(
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontFamily: 'Merriweather',
);
TextStyle kTextFancyBig = TextStyle(
  fontSize: 50,
  fontFamily: 'FleurDeLeah',
);
TextStyle kTextOlde = TextStyle(
  fontSize: 40,
  fontFamily: 'EnglishTowne',
);
//endregion

//region DECORATIONS
BoxDecoration kBoxMessage = BoxDecoration(
  color: Colors.blueGrey,
  borderRadius: BorderRadius.circular(10),
);
BoxDecoration kBoxFile = BoxDecoration(
  color: Color(0xff005853),
  borderRadius: BorderRadius.circular(5),
);
BoxDecoration kBoxUrn = BoxDecoration(
  color: Color(0xff524c54),
  borderRadius: BorderRadius.circular(5),
);
BoxDecoration kBoxPaper = BoxDecoration(
  color: Color(0xff4f4f42),
  borderRadius: BorderRadius.circular(5),
);
BoxDecoration kBoxConvo = BoxDecoration(
  color: Color(0xff000000),
  borderRadius: BorderRadius.circular(8),
);
//endregion

//region SIZING STYLES
const kSpacingDrawer = EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0);
const kSpacingConvoLeft = EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 10.0);
const kSpacingConvoRight = EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 10.0);
const kSizeDrawerIcon = 40.0;
const Alignment kConvoLeft = Alignment.centerLeft;
const Alignment kConvoRight = Alignment.centerRight;
//endregion

//region APP SCHEME
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
