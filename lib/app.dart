import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:template/config/routes.dart';

import 'config/env/dev.dart';
import 'config/env/env.dart';
import 'config/localization/app_localizations_delegate.dart';
import 'config/localization/lang/language.dart';
import 'config/theme/light_theme.dart';
import 'config/theme/theme.dart';

Environment environment = DEV.instance;
MyTheme selectedTheme = LightTheme.instance;

/*AppLocalizations lang(BuildContext context) => AppLocalizations.of(context);*/

Language lang(BuildContext context) =>
    Provider.of<MyAppController>(context).language;

class MyApp extends StatelessWidget {
  final appController = Get.find<MyAppController>();

  static Future<void> setLocaleByLanguage(String language) async {
    final _locale = await saveLocale(language);
    setLocale(_locale);
  }

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
  Widget build(BuildContext context) => _appBody(context);

  Widget _appBody(BuildContext context) => GetMaterialApp(
        title: 'Template',
        theme: Provider.of<MyAppController>(context).theme.theme,
        locale: Provider.of<MyAppController>(context).locale,
        supportedLocales: languages.keys.map((key) => Locale(key, '')).toList(),
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: Routes.gitSearch,
        getPages: Routes.pages,
      );
}

class MyAppController extends ChangeNotifier {
  var language = _defaultLanguage;
  var theme = _defaultTheme;
  var env = _defaultEnvironment;

  static Locale get _defaultLocale =>
      languages.keys.map((key) => Locale(key, '')).toList()[0];
  static Language get _defaultLanguage => getLanguageFromLocale(_defaultLocale);
  static MyTheme get _defaultTheme => LightTheme.instance;
  static Environment get _defaultEnvironment => DEV.instance;

  Locale? _locale;

  Locale get locale => _locale ?? _defaultLocale;

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }

  Future<void> init(
      Environment environment, Locale locale, MyTheme theme) async {
    setLocale(locale);
    setTheme(theme);
    setEnvironment(environment);
  }

  Future<void> setLocale(Locale _locale) async {
    this._locale = _locale;
    language = getLanguageFromLocale(_locale);
    changeLanguage(_locale.languageCode);
    notifyListeners();
  }

  Future<void> setLocaleByLanguageCode(String languageCode) async {
    final _locale = await saveLocale(languageCode);
    setLocale(_locale);
  }

  Future<void> setTheme(MyTheme _theme) async {
    theme = _theme;
    selectedTheme = _theme;
    MyTheme.set(_theme.type);
    notifyListeners();
  }

  Future<void> setEnvironment(Environment _environment) async {
    env = _environment;
    Environment.set(_environment.type);
    notifyListeners();
  }
}
