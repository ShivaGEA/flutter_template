import 'package:flutter/material.dart';
import 'package:template/config/theme/theme.dart';

class LightTheme extends MyTheme {
  @override
  ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
        primaryColor: Colors.pinkAccent,
        accentColor: Colors.pink,
        backgroundColor: const Color(0xFFE5E5E5),
        accentIconTheme: IconThemeData(color: Colors.white),
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

  LightTheme._();
  static final LightTheme _instance = LightTheme._();
  static LightTheme get instance => _instance;

  @override
  String name = "Light Theme";

  @override
  ThemeType get type => ThemeType.LIGHT;
}
