import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'constants/story_brain.dart';

ScrollController _scrollController = ScrollController();
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}
// TODO: Build Settings page as a route
// TODO: Build Recap page as a route

class _StoryPageState extends State<StoryPage> {
  String userDominantHand = 'right';
  // put the drawer into a variable to account for left/right hand
  late final Drawer myDrawer = Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(child: SizedBox()),
        ListTile(
          title: Padding(
            padding: kSpacingDrawer,
            child: Icon(Icons.settings_outlined,
                color: Colors.white60, size: kSizeDrawerIcon),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Padding(
            padding: kSpacingDrawer,
            child: Icon(Icons.book_outlined,
                color: Colors.white60, size: kSizeDrawerIcon),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Padding(
            padding: kSpacingDrawer,
            child: Icon(Icons.delete_outline,
                color: Colors.white60, size: kSizeDrawerIcon),
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
                title: Text('Warning!',
                    style: kTextLoud, textAlign: TextAlign.center),
                content: Text('This will erase all progress.',
                    style: kTextBody, textAlign: TextAlign.center),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text('Cancel', style: kTextChoice),
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
                    child: Text('Erase', style: kTextChoice),
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
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black.withOpacity(0.5),
      drawerEdgeDragWidth: 25.0,
      endDrawer: userDominantHand == 'left'
          ? Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.black,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: myDrawer,
              ),
            )
          : null,
      drawer: userDominantHand == 'right'
          ? Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.black.withOpacity(0.75),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: myDrawer,
              ),
            )
          : null,
      backgroundColor: Colors.grey[900],
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
                      Text(storyBrain.getLocation(), style: kTextInfoBar),
                      Text(storyBrain.getArcTitle(), style: kTextInfoBar),
                      Text(storyBrain.getCurrentPage(), style: kTextInfoBar),
                    ],
                  ),
                ), // InfoBar
                Divider(),
                Container(
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
                  alignment: userDominantHand == 'right'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Directionality(
                    // TODO: Create option for user to choose L or R hand
                    textDirection: userDominantHand == 'right'
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
                              child: Text(choices[index], style: kTextChoice),
                              onPressed: () {
                                setState(
                                  () {
                                    _scrollController.animateTo(
                                        _scrollController
                                            .position.minScrollExtent,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.fastOutSlowIn);
                                    storyBrain.addIfSituation();
                                    storyBrain.nextPage(index);
                                    storyBrain.buildRecap();
                                    storyBrain.getPageContents();
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
