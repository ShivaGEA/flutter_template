import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:template/config/routes.dart';

import 'config/env/dev.dart';
import 'config/env/env.dart';
import 'config/localization/app_localizations_delegate.dart';
import 'config/localization/lang/language.dart';
import 'config/theme/light_theme.dart';
import 'config/theme/theme.dart';

Environment environment = DEV.instance;
MyTheme selectedTheme = LightTheme.instance;
Language lang = getLanguageFromLocale(
    languages.keys.map((key) => Locale(key, '')).toList()[0]);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale locale = _defaultLocale;
  Language language = _defaultLanguage;
  MyTheme theme = _defaultTheme;
  Environment env = _defaultEnvironment;

  static Locale get _defaultLocale =>
      languages.keys.map((key) => Locale(key, '')).toList()[0];
  static Language get _defaultLanguage => getLanguageFromLocale(_defaultLocale);
  static MyTheme get _defaultTheme => LightTheme.instance;
  static Environment get _defaultEnvironment => DEV.instance;

  void setLocale(Locale _locale) {
    setState(() {
      locale = _locale;
    });
    Get.find<MyAppController>().setLocale(locale);
  }

  void setLocaleByLanguage(String language) {
    setLocale(language2locale(language));
  }

  void setTheme(MyTheme _theme) {
    //Get.find<MyAppController>().setTheme(theme);
    setState(() {
      theme = _theme;
    });
  }

  void setEnvironment(Environment _environment) {
    //Get.find<MyAppController>().setEnvironment(_environment);
    setState(() {
      env = _environment;
    });
  }

  @override
  Widget build(BuildContext context) => _appBody();

  Widget _appBody() => GetMaterialApp(
        title: 'Template',
        theme: theme.theme,
        locale: locale,
        supportedLocales: languages.keys.map((key) => Locale(key, '')).toList(),
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        initialRoute: Routes.gitSearch,
        getPages: Routes.pages,
      );
}

class MyAppController {
  Future<void> init(
      Environment environment, Locale locale, MyTheme theme) async {
    setLocale(locale);
    setTheme(theme);
    setEnvironment(environment);
  }

  Future<void> setLocale(Locale _locale) async {
    final language = getLanguageFromLocale(_locale);
    lang = language;
    changeLanguage(_locale.languageCode);
  }

  Future<void> setLocaleByLanguageCode(String languageCode) async {
    final _locale = await saveLocale(languageCode);
    final language = getLanguageFromLocale(_locale);
    lang = language;
    changeLanguage(_locale.languageCode);
  }

  Future<void> setTheme(MyTheme _theme) async {
    selectedTheme = _theme;
    MyTheme.set(_theme.type);
  }

  Future<void> setEnvironment(Environment _environment) async {
    environment = _environment;
    Environment.set(_environment.type);
  }
}
