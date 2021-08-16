import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../constants/constants.dart';
import '../constants/story_brain.dart';

// TODO: FEATURE! Choice Tracker to improve replayability
StoryBrain storyBrain = StoryBrain();

class StoryRoute extends StatefulWidget {
  _StoryRouteState createState() => _StoryRouteState();
}

class _StoryRouteState extends State<StoryRoute> {
  //region INITIAL SETTINGS
  final ScrollController _scrollController = ScrollController();
  late Box prefsBox;
  late bool _rightHandedUser = true;
  late bool _darkMode = true;
  late final Drawer myDrawer = Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            child: Container(
          child: IconButton(
            icon: Icon(
              Icons.info_outline,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/info');
            },
          ),
        )),
        ListTile(
          title: Padding(
            padding: kSpacingDrawer,
            child: Icon(Icons.settings_outlined, size: kSizeDrawerIcon),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
        ListTile(
          title: Padding(
            padding: kSpacingDrawer,
            child: Icon(Icons.book_outlined, size: kSizeDrawerIcon),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/recap');
          },
        ),
        ListTile(
          title: Padding(
            padding: kSpacingDrawer,
            child: Icon(Icons.delete_outline, size: kSizeDrawerIcon),
          ),
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => Container(
              decoration: BoxDecoration(
                color: Color(0x2f0000).withOpacity(0.7),
              ),
              child: AlertDialog(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                backgroundColor: Colors.black,
                title: Text('Warning!', textAlign: TextAlign.center),
                content: Text('This will erase all progress.',
                    textAlign: TextAlign.center),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text(
                      'Cancel',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          _scrollController.animateTo(
                              _scrollController.position.minScrollExtent,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.fastOutSlowIn);
                          storyBrain.resetGame();
                        },
                      );
                      Navigator.pop(context, 'Erase');
                    },
                    child: Text(
                      'Erase',
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
    prefsBox = Hive.box("preferences");
    _getPrefs();
    print('story_route.dart has fired');
  }

  void _getPrefs() async {
    final handPrefs = await prefsBox.get("rightHandedUser") ?? true;
    final modePrefs = await prefsBox.get("darkMode") ?? true;
    setState(() {
      _rightHandedUser = handPrefs;
      _darkMode = modePrefs;
    });
  }
  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 25.0,
      endDrawer: _rightHandedUser == false
          ? Theme(
              data: Theme.of(context).copyWith(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: myDrawer,
              ),
            )
          : null,
      drawer: _rightHandedUser == true
          ? Theme(
              data: Theme.of(context).copyWith(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: myDrawer,
              ),
            )
          : null,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(storyBrain.getLocation()),
                      Text(storyBrain.getArcTitle()),
                      Text(storyBrain.getCurrentPage()),
                    ],
                  ),
                ), // InfoBar
                Divider(),
                Container(
                  // STORYPAGE
                  child: Column(
                    children: List.generate(
                      storyBrain.getPageContents().length,
                      (index) {
                        List pageContents = storyBrain.getPageContents();
                        return pageContents[index];
                      },
                    ),
                  ),
                ), // StoryPage
                Divider(),
                Container(
                  height: 250.0,
                  alignment: _rightHandedUser == true
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Directionality(
                    // TODO: Create option for user to choose L or R hand
                    textDirection: _rightHandedUser == true
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: (5 / 2),
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      children: List.generate(
                        storyBrain.getChoices().length,
                        (index) {
                          List choices = storyBrain.getChoices();

                          return Container(
                            alignment: Alignment.center,
                            child: TextButton(
                              child: Text(choices[index]),
                              onPressed: () {
                                setState(
                                  () {
                                    _scrollController.animateTo(
                                        _scrollController
                                            .position.minScrollExtent,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.fastOutSlowIn);
                                    storyBrain.turnPage(index);
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ), // Choices
              ],
            ),
          ),
        ),
      ),
    );
  }
}
