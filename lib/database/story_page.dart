import 'package:flutter/material.dart';

class StoryPage {
  final List<Container> pageContents;
  final String arcTitle;
  final String location;
  final List choices;
  final List nextPageID;
  final String? addSituation;
  final String? checkSituation;

  StoryPage(
      {required this.pageContents,
      required this.arcTitle,
      required this.location,
      required this.choices,
      required this.nextPageID,
      this.addSituation,
      this.checkSituation});
}
