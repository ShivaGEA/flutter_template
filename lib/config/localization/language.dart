import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/app.dart';

import 'gen/app_localizations.dart';

AppLocalizations lang(BuildContext context) =>
    Provider.of<MyAppController>(context).localization!;

const Map<String, String> languages = {
  'en': 'English',
  'te': 'తెలుగు',
  'hi': 'हिंदी',
};

const String prefSelectedLanguageCode = 'SelectedLanguageCode';

Future<Locale> saveLocale(String languageCode) async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(prefSelectedLanguageCode, languageCode);

  final Locale locale = language2locale(languageCode);
  return locale;
}

Future<Locale> getLocale() async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
  final String languageCode =
      _prefs.getString(prefSelectedLanguageCode) ?? 'en';
  return language2locale(languageCode);
}

Locale language2locale(String languageCode) =>
    languageCode.isNotEmpty ? Locale(languageCode, '') : const Locale('en', '');

void changeLanguage(String languageCode) async {
  await saveLocale(languageCode);
}
