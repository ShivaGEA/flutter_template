import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shqs_util/shqs_util.dart';
import 'package:template/locator.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  try {
    environment = Get.find<MyAppController>().env;
    GeLog.e('Environment', environment.name);

    final lang = Get.find<MyAppController>().language;
    GeLog.e('Language', lang.name);

    selectedTheme = Get.find<MyAppController>().theme;
    GeLog.e('MyTheme', selectedTheme.name);
  } catch (e) {
    debugPrint('Error: ${e.toString()}');
  }
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => Get.find<MyAppController>(),
          builder: (context, child) {
            return MyApp();
          }),
    ]),
  );
}
