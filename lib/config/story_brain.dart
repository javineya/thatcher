import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../database/story_page.dart';

// TODO implement highlighted choice feature
// TODO implement repeat dead-end protection feature

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
  Box prefsBox = Hive.box("preferences");
  Box userSavedBox = Hive.box("userSave");
  int _pageIndex = 0;
  Set<int> _storyRecap = {0};
  Set<int> _userLibrary = {0};
  Set<String> _userSituations = {};

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
    addSituation();
    setNextPageIndex(index);
    getPageContents();
    saveGame();
  }

  int getSavedPage() {
    return _storyRecap.last;
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

  int getSituationIndex(situation) {
    switch (situation) {
      case "gameInProgress":
        {
          return _storyRecap.length == 1 ? 1 : _storyRecap.last;
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

  Container getRecapPage(index) {
    Container recapPage = _storyData[index].pageContents[0];

    return recapPage;
  }

  List<Widget> getRecapContents() {
    List<Widget> recapContents = [];
    List storyRecap = userSavedBox.get("recap").toList() ?? [0];

    int length = storyRecap.length;
    for (int i = 0; i < length; i++) {
      int recapIndex = storyRecap[i];
      Container page = Container(
        alignment: Alignment.center,
        child: getRecapPage(recapIndex),
      );
      recapContents.add(page);
    }

    return recapContents;
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
  //endregion METHODS

  //region GAME METHODS
  // TODO: save userSituations to Hive, can't load saved progress otherwise
  void loadSavedGame() {
    _storyRecap = userSavedBox.get("recap").toSet() ?? {0};
    _userLibrary = userSavedBox.get("library").toSet() ?? {0};
    _userSituations = userSavedBox.get("situations").toSet() ?? {};
    print("$_storyRecap\n$_userLibrary\n$_userSituations");
  }

  void saveGame() {
    _storyRecap.add(_pageIndex);
    List<int> recap = _storyRecap.toList();
    List<int> library = _userLibrary.toList();
    List<String> situations = _userSituations.toList();
    userSavedBox.put("recap", recap);
    userSavedBox.put("library", library);
    userSavedBox.put("situations", situations);
  }

  void resetGame() {
    _userSituations = {};
    userSavedBox.put("recap", [0]);
    _storyRecap = {0};
    _pageIndex = 0;
  }

  void addSituation() {
    if (_storyData[_pageIndex].addSituation != null) {
      _userSituations.add(_storyData[_pageIndex].addSituation!);
    }
  }
//endregion
}
