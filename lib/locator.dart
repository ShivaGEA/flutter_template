import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shqs_util/utilities/logger/logger.dart';

import '../config/env/env.dart';
import 'app.dart';
import 'config/localization/language.dart';
import 'config/theme/theme.dart';
import 'data/datasources/network/client/git_client_impl.dart';
import 'data/datasources/network/datasource/git_datasource_impl.dart';
import 'data/datasources/network/datasource/poll_datasource_impl.dart';
import 'data/repositories/git_repository_impl.dart';
import 'domain/datasources/database/database.dart';

Future<void> setupLocator() async {
  Get.put(MyAppController());

  await _loadCache();
  final env = await _setupEnvironment();
  final locale = await _setupLocale();
  final theme = await _setupTheme();
  Get.find<MyAppController>().init(env, locale, theme);
  await _setupResources();
}

Future<void> _loadCache() async {
  //final instance = await Cache.instance; //loadcache
  //debugPrint('==> Cache Env==> ${instance.environment}');
}

Future<Environment> _setupEnvironment() async {
  final env = Get.put(await Environment.load());
  Get.find<MyAppController>().setEnvironment(env);
  //debugPrint('==> Setup Env==> ${env.name}');
  return env;
}

Future<Locale> _setupLocale() async {
  final locale = Get.put(await getLocale());
  Get.find<MyAppController>().setLocale(locale);
  //debugPrint('==>Locale: $locale');
  return locale;
}

Future<MyTheme> _setupTheme() async {
  final theme = Get.put(await MyTheme.get());
  Get.find<MyAppController>().setTheme(theme);
  //debugPrint('==> Setup theme==> ${theme.name}');
  return theme;
}

Future<void> _setupResources() async {
  final dio = Dio()..interceptors.add(GeLogInterceptor());
  final database = await $FloorAppDataBase.databaseBuilder('app.db').build();
  Get.put(dio);
  Get.put(database);
  gitResourcesInit();
  pollResourcesInit();
}

void pollResourcesInit() {
  Get.put(PollDataSourceImpl());
}

//Git resources initialising
void gitResourcesInit() {
  Get.put(Get.find<AppDataBase>().repositoryDao);
  final client = GitClientImpl(
    Get.find<Dio>(),
    baseUrl: Get.find<Environment>().baseUrl,
  );
  Get.put(GitDataSourceImpl(client));
  Get.put(GitRepositoryImpl());
}
