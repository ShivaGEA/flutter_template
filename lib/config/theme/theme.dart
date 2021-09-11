import 'package:flutter/material.dart';
import 'package:shqs_util/utilities/logger/logger.dart';
import 'package:template/config/theme/blue_theme.dart';
import 'package:template/config/theme/red_theme.dart';
import 'package:template/config/theme/yellow_theme.dart';
import 'package:template/data/cache.dart';

import 'dark_theme.dart';
import 'green_theme.dart';
import 'light_theme.dart';

enum ThemeType { LIGHT, DARK, BLUE, RED, YELLOW, GREEN }

abstract class MyTheme {
  ThemeType get type;
  String get name;

  ThemeData get theme;

  static late MyTheme _theme;
  static bool _isInitialised = false;

  static Future<MyTheme> get() async =>
      _isInitialised ? _theme : (await set(await _getPreSavedTheme()));

  static Future<MyTheme> set(ThemeType themeType) async {
    await _save(themeType);
    if (themeType == ThemeType.LIGHT)
      GeLog.logLevel = LogLevel.error;
    else
      GeLog.logLevel = LogLevel.verbose;
    _isInitialised = true;
    _theme = getTheme(themeType);
    return _theme;
  }

  // Load the theme from below priority order
  // Cache
  // Default type

  //save theme type into local database
  static _save(ThemeType type) async {
    print("Save to cache: theme=> $type");
    return await (await Cache.instance).saveTheme(type);
  }

  //get pre saved theme from Local database
  static Future<ThemeType> _getPreSavedTheme() async {
    var theme = (await Cache.instance).theme;
    print("From cache: theme=> $theme");
    return _getThemeType(theme ?? '') ?? ThemeType.LIGHT;
  }

  //String to ThemeType (enum) conversion
  static _getThemeType(String type) => type != ''
      ? ThemeType.values.firstWhere((element) => element.toString() == type)
      : null;

  static MyTheme getTheme(ThemeType type) {
    if (type == ThemeType.LIGHT) return LightTheme.instance;
    if (type == ThemeType.DARK) return DarkTheme.instance;
    if (type == ThemeType.BLUE) return BlueTheme.instance;
    if (type == ThemeType.RED) return RedTheme.instance;
    if (type == ThemeType.YELLOW) return YellowTheme.instance;
    if (type == ThemeType.GREEN) return GreenTheme.instance;
    else
      return LightTheme.instance; //Default Theme
  }
}
