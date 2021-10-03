import 'package:flutter/material.dart';
import '../resources/constants.dart';

// TODO: decide if this is necessary / what to put here

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
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Credits\n\n',
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Thatcher was written and created by a single person'
                            '. If there are bugs or errors in either the game or '
                            'the writing, I do apologize. Please inform me so I '
                            'can fix them.\n\n',
                      )
                    ],
                  ),
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
