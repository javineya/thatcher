import 'package:flutter/material.dart';
import '../constants/constants.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Settings!',
                style: kTextLoud,
                textAlign: TextAlign.center,
              ),
            ),
            FloatingActionButton(onPressed: () {
              Navigator.pushNamed(context, '/');
            })
          ],
        ),
      ),
    );
  }
}
