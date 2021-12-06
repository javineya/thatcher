import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ConvoCardLeft extends StatelessWidget {
  final String convoText;
  const ConvoCardLeft({required this.convoText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kSpacingConvoLeft,
      decoration: kBoxConvo,
      alignment: kConvoLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(convoText, style: kTextBody),
      ),
    );
  }
}

class ConvoCardRight extends StatelessWidget {
  final String convoText;
  const ConvoCardRight({required this.convoText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kSpacingConvoRight,
      decoration: kBoxConvo,
      alignment: kConvoLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(convoText, style: kTextBody),
      ),
    );
  }
}
