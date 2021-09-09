part of 'InsecureSharedPreferences.dart';

/// Extended SharedPreferences class with encrypt String values
class SecureSharedPreferences extends InsecureSharedPreferences {
  static Completer<SecureSharedPreferences>? _completer;

  SecureSharedPreferences._(_sharedPreference) : super._(_sharedPreference);

  static Future<ShqsSharedPreferences> get instance async {
    if (_completer == null) {
      final completer = Completer<SecureSharedPreferences>();
      final sharedPreference = await SharedPreferences.getInstance();
      completer.complete(SecureSharedPreferences._(sharedPreference));

      _completer = completer;
    }

    return _completer!.future;
  }

  @override
  Future<bool> setString(String key, String value) async {

    return super.setString(key, SecurityUtils.encrypt(value));
  }

  @override
  Future<bool> setStringList(String key, List<String> values) async {
    final encrypted = <String>[];

    for (var value in values) {
      encrypted.add(SecurityUtils.encrypt(value));
    }

    return super.setStringList(key, encrypted);
  }

  @override
  Future<bool> appendToStringList(String key, String value) async {
    final list = getStringList(key);
    list.add(SecurityUtils.encrypt(value));
    return setStringList(key, list);
  }

  @override
  String? getString(String key) {
    var value = super.getString(key);

    if (value == null) {
      return value;
    }

    return SecurityUtils.decrypt(value);
  }

  @override
  List<String> getStringList(String key) {
    var values = super.getStringList(key);
    var decrypted = <String>[];

    for (var value in values) {
      decrypted.add(SecurityUtils.decrypt(value));
    }

    return decrypted;
  }
}