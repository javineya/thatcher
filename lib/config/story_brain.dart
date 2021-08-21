import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../database/story_page.dart';

//region TEST DATA
List<StoryPage> _storyData = [
  StoryPage(
    location: '',
    arcTitle: '',
    pageContents: [
      Container(
        child: Text.rich(
          TextSpan(
            text: 'Test Data\n\n',
            children: <TextSpan>[
              TextSpan(text: 'Subtitle Text\n\n'),
              TextSpan(text: 'by JesterVae'),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
    choices: ['Continue'],
    addSituation: 'gameInProgress',
    checkSituation: 'gameInProgress',
    nextPageID: [1],
  ), // 0 >> 1, 5
  StoryPage(
    location: '',
    arcTitle: 'Prologue',
    pageContents: [
      Container(
        child: Text.rich(
            TextSpan(
              text: '“Title Text”\n More Title Text\n\n',
              children: <TextSpan>[
                TextSpan(
                  text:
                      '\t\tIndent with 2 tabs? \n\t\t Newline 2 tabs for joined '
                      'paragraph. \n\n\t\t 2 newlines 2 tabs for separated text.',
                ),
              ],
            ),
            textAlign: TextAlign.center),
      )
    ],
    choices: ['Page 3', 'Page 2'],
    nextPageID: [3, 2],
  ), // 1 >> 2, 3
  StoryPage(
      location: '',
      arcTitle: 'Prologue',
      pageContents: [
        Container(
          child: Text.rich(
            TextSpan(
              text: '-Narration!-\n'
                  '\n',
              children: <TextSpan>[
                TextSpan(text: 'Bullshit! '),
                TextSpan(
                  text: 'More Text.\n\n',
                ),
                TextSpan(
                  text: '-Narration style!-\n\n',
                ),
                TextSpan(
                  text: 'Talking, talking.',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
      choices: ['Choice'],
      nextPageID: [3],
      addSituation: 'testSituation',
      checkSituation: 'testSituation'), // 2 >> 3 !4
  StoryPage(
    location: '',
    arcTitle: 'Prologue',
    pageContents: [
      Container(
        child: Column(
          children: [
            Text(
              '-You come to the end of the test database.-\n\n',
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'TO: theUser@thatcher\n'
                  'FR: theDeveloper@thatcher\n\n'
                  'SB: Figure Out Message Background\n\n'
                  'You want to have a message background. Make it work.',
                ),
              ),
            )
          ],
        ),
      )
    ],
    choices: ['Restart'],
    nextPageID: [0],
  ), // 3 >> 0
  StoryPage(
    location: '',
    arcTitle: 'Situation!',
    pageContents: [
      Container(
        child: Text.rich(
          TextSpan(
            text: '-You successfully passed a situation!.-\n\n',
            children: <TextSpan>[
              TextSpan(
                text: 'Now keep working!',
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
    choices: ['Restart'],
    nextPageID: [0],
  ), // 4 >> 0
  StoryPage(
    location: '',
    arcTitle: 'Continue Button Test!',
    pageContents: [
      Container(
        child: Text.rich(
          TextSpan(
            text: 'If you did it right, you will see this page.-\n\n',
            children: <TextSpan>[
              TextSpan(
                text: 'Excellent! Now keep working!',
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
    choices: ['Restart'],
    nextPageID: [0],
  ), // 5 >> 0
];

//endregion

class StoryBrain {
  int _pageIndex = 0;
  Box prefsBox = Hive.box("preferences");
  Box userSavedBox = Hive.box("userSave");

  //region INFOBAR METHODS
  String getLocation() {
    return _storyData[_pageIndex].location;
  }

  String getArcTitle() {
    return _storyData[_pageIndex].arcTitle;
  }

  String getCurrentPage() {
    return _pageIndex > 0 ? _pageIndex.toString() : '';
  }

  //endregion

  //region      PAGE VIEW METHODS
  void turnPage(index) {
    buildRecap();
    addIfSituation();
    setNextPageIndex(index);
    getPageContents();
  }

  int getSavedPage() {
    return storyRecap.last;
  }

  List getPageContents() {
    List pageContents = _storyData[_pageIndex].pageContents;

    return pageContents;
  }

  List getChoices() {
    return _storyData[_pageIndex].choices;
  }

  List getGridChoices() {
    List choices = getChoices();
    List pageChoices = [];

    for (String choice in choices) {
      Text choiceText = Text(choice, textAlign: TextAlign.center);

      pageChoices.add(choiceText);
    }

    return pageChoices;
  }

  List getNextCellIDs() {
    return _storyData[_pageIndex].nextPageID;
  }

  //endregion METHODS

  //region GAME METHODS
  // TODO: save userSituations to Hive, can't load saved progress otherwise
  void loadSavedGame() {}

  Set<String> _userSituations = {};

  void resetGame() {
    _userSituations = {};
    userSavedBox.clear();
    storyRecap = {0};
    _pageIndex = 0;
  }

  void addIfSituation() {
    if (_storyData[_pageIndex].addSituation != null) {
      _userSituations.add(_storyData[_pageIndex].addSituation!);
    }
  }

  int getSituationIndex(situation) {
    switch (situation) {
      case "gameInProgress":
        {
          return storyRecap.length == 1 ? 1 : storyRecap.last;
        }

      case "testSituation":
        {
          return 5;
        }

      default:
        {
          return 0;
        }
    }
  }

  // TODO: REMEMBER: situation checks come BEFORE the new page.
  void setNextPageIndex(int nextPageIndex) {
    if (_storyData[_pageIndex].checkSituation != null) {
      String situation = _storyData[_pageIndex].checkSituation!;
      _pageIndex = getSituationIndex(situation);
    } else {
      _pageIndex = _storyData[_pageIndex].nextPageID[nextPageIndex];
    }
  }

  Set<int> storyRecap = {0};

  void buildRecap() {
    storyRecap.add(_pageIndex);
    List<int> recap = storyRecap.toList();
    userSavedBox.put("recap", recap);
  }

  void setRecap() {
    List<int> recap = userSavedBox.get("recap") ?? [0];
    storyRecap = recap.toSet();
  }
//endregion

//region SETTINGS METHODS
}
