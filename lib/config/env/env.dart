import 'package:flutter/foundation.dart';
import 'package:shqs_util/utilities/logger/logger.dart';

import '../../data/cache.dart';
import 'dev.dart';
import 'prod.dart';
import 'qa.dart';
import 'uat.dart';

enum BuildType { DEV, QA, UAT, PROD }

abstract class Environment {
  String get name;
  BuildType get type => BuildType.DEV;
  String get baseUrl;

  static const login = '/login';
  static const signup = '/signup';
  static const profile = '/profile';
  static const updateProfile = '/updateProfile';
  static const resetPassword = '/resetPassword';
  static const gitRepositories = '/repositories';
  static const gitSearch = '/search';

  static late Environment _env;
  static bool _isInitialised = false;

  static Future<Environment> get() async =>
      _isInitialised ? _env : _getEnv(await _getPreSavedEnv());

  static Future<Environment> set(BuildType buildType) async {
    await _save(buildType);
    if (buildType == BuildType.PROD) {
      GeLog.logLevel = LogLevel.error;
    } else {
      GeLog.logLevel = LogLevel.verbose;
    }
    _isInitialised = true;
    _env = _getEnv(buildType);
    return _env;
  }

  // it Load the environment from below priority order
  // Command
  // Cache
  // Default type
  static Future<Environment> load() async {
    const String type = String.fromEnvironment('Environment');
    final BuildType? buildType = _getBuildType(type);
    final preSavedEnv = await _getPreSavedEnv();
    return await Environment.set(buildType ?? preSavedEnv);
  }

  //save environment into Local database
  static Future<void> _save(BuildType type) async =>
      await (await Cache.instance).saveEnvironment(type);

  //get pre saved environment from Local database
  static Future<BuildType> _getPreSavedEnv() async =>
      _getBuildType((await Cache.instance).environment ?? '') ?? BuildType.DEV;

  static BuildType? _getBuildType(String type) => type != ''
      ? BuildType.values.firstWhere((element) => element.toString() == type)
      : null;

  static Environment _getEnv(BuildType buildType) {
    if (buildType == BuildType.DEV) return DEV.instance;
    if (buildType == BuildType.QA) return QA.instance;
    if (buildType == BuildType.UAT) return UAT.instance;
    if (buildType == BuildType.PROD) {
      return PROD.instance;
    } else {
      return DEV.instance;
    } //Default environment
  }

  static const isDebugMode = kDebugMode;
  static const isReleaseMode = kReleaseMode;
  static const isProfileMode = kProfileMode;
}

/*
class DEV extends Environment {
  @override
  String name = BuildType.DEV.toString();
  @override
  String baseUrl = "https://api.github.com";

  DEV._privateConstructor();
  static final DEV _instance = DEV._privateConstructor();
  static DEV get instance => _instance;
}

class PROD extends Environment {
  @override
  String name = BuildType.PROD.toString();
  @override
  String baseUrl = "https://api.github.com";

  PROD._privateConstructor();
  static final PROD _instance = PROD._privateConstructor();
  static PROD get instance => _instance;
}

class QA extends Environment {
  @override
  String name = BuildType.QA.toString();
  @override
  String baseUrl = "https://api.github.com";

  QA._privateConstructor();
  static final QA _instance = QA._privateConstructor();
  static QA get instance => _instance;
}

class UAT extends Environment {
  @override
  String name = BuildType.UAT.toString();
  @override
  String baseUrl = "https://api.github.com";

  UAT._privateConstructor();
  static final UAT _instance = UAT._privateConstructor();
  static UAT get instance => _instance;
}
*/
