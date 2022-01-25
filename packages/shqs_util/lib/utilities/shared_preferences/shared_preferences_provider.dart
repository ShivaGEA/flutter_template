import 'impl/InsecureSharedPreferences.dart';
import 'shared_preferences.dart';

class GeaSharedPreferencesProvider {
  static Future<GeaSharedPreferences> createInSequrePreference() async =>
      await InsecureSharedPreferences.instance;

  static Future<GeaSharedPreferences> createSequrePreference() async =>
      await SecureSharedPreferences.instance;
}
