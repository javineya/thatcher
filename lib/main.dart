import 'package:flutter/material.dart';
import './constants/constants.dart';

void main() => runApp(Thatcher());

class Thatcher extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'CrimsonText'),
        initialRoute: '/',
        routes: kRoutes);
  }
}
