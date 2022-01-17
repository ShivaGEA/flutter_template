import 'dart:convert';

import 'package:shqs_util/shqs_util.dart';

abstract class ShqsSharedPreferences {
  Future<bool> setBool(String key, bool value);
  Future<bool> setInt(String key, int value);
  Future<bool> setDouble(String key, double value);
  Future<bool> setString(String key, String value);
  Future<bool> setStringList(String key, List<String> values);
  Future<bool> appendToStringList(String key, String value);

  bool? getBool(String key);
  int? getInt(String key);
  double? getDouble(String key);
  String? getString(String key);
  List<String> getStringList(String key);

  Future<bool> clear();
  Future<bool> remove(String key);
  Future<bool> containsKey(String key);
  Set<String> getKeys();
  Future<void> reload();

  Future<bool> setObject(String key, dynamic objectToJson) {
    final jsonString = json.encode(objectToJson);
    return setString(key, jsonString);
  }

  dynamic getObject(String key, Function fromMapClosure) {
    final jsonString = getString(key);
    if (jsonString != null) {
      try {
        final map = json.decode(jsonString);
        return fromMapClosure(map);
      } catch (e) {
        GeLog.e('ShqsSharedPreferences', 'json decoding failed: $key, $e');
      }
    }

    return null;
  }
}
