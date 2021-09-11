import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shqs_util/shqs_util.dart';
import 'package:template/config/env/env.dart';
import 'package:template/config/theme/light_theme.dart';
import 'package:template/config/theme/theme.dart';
import 'package:template/locator.dart';
import 'package:template/ui/pages/git/search/git_search_page.dart';

import 'config/env/dev.dart';
import 'config/localization/app_localizations_delegate.dart';
import 'config/localization/lang/language.dart';

Environment environment = DEV.instance;
MyTheme selectedTheme = LightTheme.instance;
Language lang = getLanguageFromLocale(
    languages.keys.map((key) => Locale(key, '')).toList()[0]);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  try {
    environment = Get.find<MyAppController>().env.value;
    GeLog.e("Environment", environment.name);

    lang = Get.find<MyAppController>().language.value;
    GeLog.e("Language", lang.name);

    selectedTheme = Get.find<MyAppController>().theme.value;
    GeLog.e("MyTheme", selectedTheme.name);
  } catch (e) {
    print('Error: ${e.toString()}');
  }

  runApp(MyApp());
}

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
        home: GitSearchPage(),
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

  MyAppController() {
    //init(_defaultEnvironment, _defaultLocale, _defaultTheme);
  }

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
  }
}
