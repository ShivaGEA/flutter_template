import 'shared_preferences.dart';
import 'impl/InsecureSharedPreferences.dart';

class ShqsSharedPreferencesProvider {

  static Future<ShqsSharedPreferences> createInSequrePreference() async =>
      await InsecureSharedPreferences.instance;

  static Future<ShqsSharedPreferences> createSequrePreference() async =>
      await SecureSharedPreferences.instance;

}
