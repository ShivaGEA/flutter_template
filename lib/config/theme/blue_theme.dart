import 'package:flutter/material.dart';
import 'package:template/config/theme/theme.dart';

class BlueTheme extends MyTheme {
  @override
  ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueAccent,
        backgroundColor: const Color(0xFFE5E5E5),
        dividerColor: Colors.white54,

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
          headline6: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
        ),
      );

  BlueTheme._();
  static final MyTheme _instance = BlueTheme._();
  static MyTheme get instance => _instance;

  @override
  String name = 'Blue Theme';

  @override
  ThemeType get type => ThemeType.BLUE;
}
