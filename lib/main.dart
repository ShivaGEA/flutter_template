import 'package:flutter/material.dart';
import 'package:template/locator.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  /*try {
    environment = Get.find<MyAppController>().env.value;
    GeLog.e("Environment", environment.name);

    lang = Get.find<MyAppController>().language.value;
    GeLog.e("Language", lang.name);

    selectedTheme = Get.find<MyAppController>().theme.value;
    GeLog.e("MyTheme", selectedTheme.name);
  } catch (e) {
    debugPrint('Error: ${e.toString()}');
  }*/

  runApp(MyApp());
}
