import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/config/env/env.dart';
import 'package:template/config/theme/theme.dart';

class _Key {
  static const String environment = 'environment';
  static const String theme = 'theme';
  static const String locale = 'locale';
}

class Cache {
  SharedPreferences? _prefs;
  static Cache? _instance;
  static Future<Cache> get instance async => _instance ?? await getInstance();

  static Future<Cache> getInstance() async {
    _instance = Cache._();
    await _instance!._init();
    return _instance!;
  }

  Cache._();

  Completer? _completer;
  Future<void> _init() async {
    if (_completer == null) {
      final completer = Completer<SharedPreferences>();
      try {
        _prefs = await SharedPreferences.getInstance();
        completer.complete(_prefs);
      } on Exception catch (e) {
        debugPrint(e.toString());
        completer.future;
        _completer = null;
        return null;
      }
      _completer = completer;
    }
    return _completer!.future;
  }

  String? get environment => _prefs?.getString(_Key.environment);
  Future<void> saveEnvironment(BuildType type) async =>
      await _prefs?.setString(_Key.environment, type.toString());

  String? get theme => _prefs?.getString(_Key.theme);
  Future<void> saveTheme(ThemeType type) async =>
      await _prefs?.setString(_Key.theme, type.toString());

  String? get locale => _prefs?.getString(_Key.locale);
  Future<void> saveLocale(ThemeType type) async =>
      await _prefs?.setString(_Key.theme, type.toString());
}
