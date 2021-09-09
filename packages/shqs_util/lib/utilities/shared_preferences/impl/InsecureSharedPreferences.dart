import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import '../shared_preferences.dart';
import '../../../shqs_util.dart';

part 'SecureSharedPreferences.dart';

/// Extended SharedPreferences class without encrypt String values
class InsecureSharedPreferences extends ShqsSharedPreferences {
  final SharedPreferences _sharedPreference;

  InsecureSharedPreferences._(this._sharedPreference);

  static Completer<InsecureSharedPreferences>? _completer;

  static Future<ShqsSharedPreferences> get instance async {
    if (_completer == null) {
      final completer = Completer<InsecureSharedPreferences>();
      final sharedPreference = await SharedPreferences.getInstance();
      completer.complete(InsecureSharedPreferences._(sharedPreference));

      _completer = completer;
    }

    return _completer!.future;
  }

  @override
  Future<bool> setBool(String key, bool value) async =>
      await _sharedPreference.setBool(key, value);

  @override
  Future<bool> setInt(String key, int value) async =>
      await _sharedPreference.setInt(key, value);

  @override
  Future<bool> setDouble(String key, double value) async =>
      await _sharedPreference.setDouble(key, value);

  @override
  Future<bool> setString(String key, String value) async =>
      await _sharedPreference.setString(key, value);

  @override
  Future<bool> setStringList(String key, List<String> values) async =>
      await _sharedPreference.setStringList(key, values);

  @override
  Future<bool> appendToStringList(String key, String value) async {
    final list = getStringList(key);
    list.add(value);
    return setStringList(key, list);
  }

  @override
  bool? getBool(String key) => _sharedPreference.getBool(key);

  @override
  int? getInt(String key) => _sharedPreference.getInt(key);

  @override
  double? getDouble(String key) => _sharedPreference.getDouble(key);

  @override
  String? getString(String key) => _sharedPreference.getString(key);

  @override
  List<String> getStringList(String key) {
    final saved = _sharedPreference.getStringList(key);
    final result = <String>[];
    if (saved != null) {
      result.addAll(saved);
    }
    return result;
  }

  @override
  Future<bool> clear() async => _sharedPreference.clear();

  @override
  Future<bool> remove(String key) async => _sharedPreference.remove(key);

  @override
  Future<bool> containsKey(String key) async =>
      _sharedPreference.containsKey(key);

  @override
  Set<String> getKeys() => _sharedPreference.getKeys();

  @override
  Future<void> reload() => _sharedPreference.reload();

}
