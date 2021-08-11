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
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Credits\n\n',
                    style: kTextLoud,
                    children: <TextSpan>[TextSpan(text: 'More info later.')],
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
