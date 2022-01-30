import 'package:flutter/material.dart';
import 'package:shqs_util/utilities/logger/logger.dart';

import '../../data/cache.dart';
import 'blue_theme.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

enum ThemeType {
  LIGHT,
  DARK,
  BLUE,
}

abstract class MyTheme {
  ThemeType get type;
  String get name;

  ThemeData get theme;

  static late MyTheme _theme;
  static bool _isInitialised = false;

  static Future<MyTheme> get() async =>
      _isInitialised ? _theme : (getTheme(await _getPreSavedTheme()));

  static Future<MyTheme> set(ThemeType themeType) async {
    await _save(themeType);
    if (themeType == ThemeType.LIGHT) {
      GeLog.logLevel = LogLevel.error;
    } else {
      GeLog.logLevel = LogLevel.verbose;
    }
    _isInitialised = true;
    _theme = getTheme(themeType);
    return _theme;
  }

  // Load the theme from below priority order
  // Cache
  // Default type

  //save theme type into local database
  static Future<void> _save(ThemeType type) async {
    debugPrint('Save to cache: theme=> $type');
    return await (await Cache.instance).saveTheme(type);
  }

  //get pre saved theme from Local database
  static Future<ThemeType> _getPreSavedTheme() async {
    final theme = (await Cache.instance).theme;
    debugPrint('From cache: theme=> $theme');
    return _getThemeType(theme ?? '') ?? ThemeType.LIGHT;
  }

  //String to ThemeType (enum) conversion
  static ThemeType? _getThemeType(String type) {
    try {
      return type != ''
          ? ThemeType.values.firstWhere((element) => element.toString() == type)
          : null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

MyTheme getTheme(ThemeType type) {
  if (type == ThemeType.LIGHT) return LightTheme.instance;
  if (type == ThemeType.DARK) return DarkTheme.instance;
  if (type == ThemeType.BLUE) {
    return BlueTheme.instance;
  } else {
    return LightTheme.instance;
  } //Default Theme
}
