import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:template/config/routes.dart';

import 'config/env/dev.dart';
import 'config/env/env.dart';
import 'config/localization/app_localizations_delegate.dart';
import 'config/localization/lang/language.dart';
import 'config/theme/light_theme.dart';
import 'config/theme/theme.dart';
import 'main.dart';

class MyApp extends GetWidget<MyAppController> {
  final appController = Get.find<MyAppController>();

  static void setLocale(Locale locale) {
    Get.find<MyAppController>().setLocale(locale);
  }

  static void setTheme(MyTheme theme) {
    Get.find<MyAppController>().setTheme(theme);
  }

  static void setEnvironment(Environment environment) {
    Get.find<MyAppController>().setEnvironment(environment);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Obx(() => _appBody(controller));

  Widget _appBody(MyAppController controller) => GetMaterialApp(
        title: 'Template',
        theme: controller.theme.value.theme,
        locale: controller.locale.value,
        supportedLocales: languages.keys.map((key) => Locale(key, '')).toList(),
        localizationsDelegates: [
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

class MyAppController extends GetxController {
  var locale = _defaultLocale.obs;
  var language = _defaultLanguage.obs;
  var theme = _defaultTheme.obs;
  var env = _defaultEnvironment.obs;

  static Locale get _defaultLocale =>
      languages.keys.map((key) => Locale(key, '')).toList()[0];
  static Language get _defaultLanguage => getLanguageFromLocale(_defaultLocale);
  static MyTheme get _defaultTheme => LightTheme.instance;
  static Environment get _defaultEnvironment => DEV.instance;

  Future<void> init(
      Environment environment, Locale locale, MyTheme theme) async {
    setLocale(locale);
    setTheme(theme);
    setEnvironment(environment);
  }

  Future<void> setLocale(Locale _locale) async {
    this.locale.value = _locale;
    this.language.value = getLanguageFromLocale(_locale);
    lang = this.language.value;
    changeLanguage(_locale.languageCode);
  }

  Future<void> setLocaleByLanguageCode(String languageCode) async {
    var _locale = await saveLocale(languageCode);
    this.locale.value = _locale;
    this.language.value = getLanguageFromLocale(_locale);
    lang = this.language.value;
    changeLanguage(_locale.languageCode);
  }

  Future<void> setTheme(MyTheme _theme) async {
    this.theme.value = _theme;
    selectedTheme = _theme;
    MyTheme.set(_theme.type);
  }

  Future<void> setEnvironment(Environment _environment) async {
    this.env.value = environment;
    environment = _environment;
    Environment.set(_environment.type);
  }
}
