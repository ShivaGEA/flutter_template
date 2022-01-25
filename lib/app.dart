import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'config/env/dev.dart';
import 'config/env/env.dart';
import 'config/localization/gen/app_localizations.dart';
import 'config/localization/language.dart';
import 'config/routes.dart';
import 'config/theme/light_theme.dart';
import 'config/theme/theme.dart';

Environment environment = DEV.instance;
MyTheme selectedTheme = LightTheme.instance;

class MyApp extends StatelessWidget {
  final appController = Get.find<MyAppController>();

  static Future<void> setLocaleByLanguageCode(
      BuildContext context, String language) async {
    final _locale = await saveLocale(language);
    setLocale(context, _locale);
  }

  static void setLocale(BuildContext context, Locale locale) {
    Provider.of<MyAppController>(Get.context!, listen: false).setLocale(locale);
  }

  static void setTheme(BuildContext context, MyTheme theme) {
    Provider.of<MyAppController>(Get.context!, listen: false).setTheme(theme);
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
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: Routes.gitSearch,
        getPages: Routes.pages,
      );
}

class MyAppController extends ChangeNotifier {
  var theme = _defaultTheme;
  var env = _defaultEnvironment;

  static MyTheme get _defaultTheme => LightTheme.instance;
  static Environment get _defaultEnvironment => DEV.instance;

  Locale? locale;
  AppLocalizations? localization;

  void clearLocale() {
    locale = null;
    notifyListeners();
  }

  Future<void> init(
      Environment environment, Locale locale, MyTheme theme) async {
    setLocale(locale);
    setTheme(theme);
    setEnvironment(environment);
  }

  Future<void> setLocale(Locale _locale) async {
    locale = _locale;
    localization =
        lookupAppLocalizations(locale ?? AppLocalizations.supportedLocales[0]);
    print(_locale);
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
