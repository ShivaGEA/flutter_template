import 'dart:async';

import '/config/env/env.dart';
import '/config/theme/theme.dart';

class Cache {
  //SharedPreferences? _prefs;
  static Cache? _instance;
  static Future<Cache> get instance async => _instance ?? await getInstance();

  static Future<Cache> getInstance() async {
    _instance = Cache._();
    return _instance!;
  }

  Cache._();

  Future<void> saveEnvironment(BuildType type) async {
    return;
  }

  Future<void> saveTheme(ThemeType type) async {}
  Future<void> saveLocale(ThemeType type) async {}
}
