import 'package:flutter/material.dart';
import '../constants/constants.dart';

class InfoRoute extends StatelessWidget {
  const InfoRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.grey[900],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 90.0),
                SafeArea(
                  child: SingleChildScrollView(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'If You\'re Interested\n\n',
                        style: kTextTitle,
                        children: <TextSpan>[
                          TextSpan(
                              style: kTextBody,
                              text: 'I wrote Thatcher '
                                  'over 6 years ago for a random writing project I '
                                  'found on CraigsList. That project, unfortunately, '
                                  'never panned out, so Thatcher just collected dust '
                                  'in my computer. I\'d never written anything so '
                                  'substantial before, so I was a little bummed.'
                                  '\n\n'
                                  'After years of learning to code, I stumbled '
                                  'across Flutter and began learning. One project '
                                  'was a \'Choose-Your-Own-Adventure\' game. It was '
                                  'super basic, but I immediately thought of '
                                  'Thatcher, and decided right then to expand this '
                                  'little project app into an actual home for '
                                  'Thatcher.'
                                  '\n\n'
                                  'Did not know what I was getting myself into...'
                                  '\n\n'
                                  'Coding is somewhat dangerous for a perfectionist, '
                                  'I think. I was never content with \'good enough\'.'
                                  ' I knew what I wanted the game to look like, and '
                                  'how I wanted to avoid all the pitfalls I had seen '
                                  'in other CYOA games. I played all the major ones '
                                  'when I was first writing Thatcher, to see how they'
                                  ' worked. Most of them were not worth a second '
                                  'play, because they were written like a chain: You '
                                  'made choices, but usually ended up in the exact '
                                  'same place in the story. I wrote Thatcher to look '
                                  'more like the roots of a tree, where you would '
                                  'need to play several times to get a full picture. '
                                  'And, ideally, you would want to play.'
                                  '')
                        ],
                      ),
                    ),
                  )),
                ),
                FloatingActionButton(onPressed: () {
                  Navigator.pushNamed(context, '/');
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
