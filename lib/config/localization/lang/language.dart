import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Language {
  static Language? of(BuildContext context) {
    return Localizations.of<Language>(context, Language);
  }

  String get appName => "Template";
  String get name => "Name";
  String get selectLanguage => "Select Language";
  String get name1;
  String get loadMore => "Load More";
  String get search => "Search";
  String get loading => "Loading...";
  String get theme => "Theme";
}

const Map<String, String> languages = {
  'en': "English",
  'te': "తెలుగు",
  'hi': "हिंदी",
};

const String prefSelectedLanguageCode = "SelectedLanguageCode";

Future<Locale> saveLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(prefSelectedLanguageCode, languageCode);

  Locale locale = language2locale(languageCode);
  return locale;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(prefSelectedLanguageCode) ?? "en";
  return language2locale(languageCode);
}

Locale language2locale(String languageCode) =>
    languageCode.isNotEmpty ? Locale(languageCode, '') : Locale('en', '');

void changeLanguage(String languageCode) async {
  await saveLocale(languageCode);
}
