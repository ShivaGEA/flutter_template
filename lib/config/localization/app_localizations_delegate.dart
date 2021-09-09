import 'package:flutter/cupertino.dart';

import 'lang/lang_en_in.dart';
import 'lang/lang_en_us.dart';
import 'lang/lang_hi.dart';
import 'lang/lang_te.dart';
import 'lang/language.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Language> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      languages.keys.contains(locale.languageCode);

  @override
  Future<Language> load(Locale locale) async => getLanguageFromLocale(locale);

  @override
  bool shouldReload(LocalizationsDelegate<Language> old) => false;
}

Language getLanguageFromLocale(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return EnIn();
    case 'te':
      return Telugu();
    case 'hi':
      return Hindi();
    default:
      return EnUs();
  }
}
