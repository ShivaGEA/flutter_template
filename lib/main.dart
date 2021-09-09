import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shqs_util/shqs_util.dart';
import 'package:template/config/env/env.dart';
import 'package:template/config/theme/light_theme.dart';
import 'package:template/config/theme/theme.dart';
import 'package:template/locator.dart';

import 'app.dart';
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
