import 'package:flutter/material.dart';

// TODO: refactor pageContents and remove List

class StoryPage {
  final List<Container> pageContents;
  final String arcTitle;
  final String location;
  final List choices;
  final List nextPageID;
  final String? addSituation;
  final String? checkSituation;

  // arguments must be inside {} because they are named arguments
  StoryPage(
      {required this.pageContents,
      required this.arcTitle,
      required this.location,
      required this.choices,
      required this.nextPageID,
      this.addSituation,
      this.checkSituation});
}
