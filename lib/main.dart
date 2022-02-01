import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shqs_util/shqs_util.dart';

import 'app.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  try {
    environment = Get.find<MyAppController>().env;
    GeLog.e('Environment', environment.name);

    final localization = Get.find<MyAppController>().localization;
    GeLog.e('Language', localization?.name ?? 'language not selected');

    selectedTheme = Get.find<MyAppController>().theme;
    GeLog.e('MyTheme', selectedTheme.name);
  } catch (e) {
    GeLog.e('Error', ' ${e.toString()}');
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Get.find<MyAppController>(),
          builder: (context, child) => MyApp(),
        ),
      ],
    ),
  );
}
