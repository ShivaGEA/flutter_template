/*

enum BuildType { dev, field, prod }

extension TypeName on BuildType {
  String get name {
    if (index == BuildType.dev.index)
      return 'Dev';
    else if (index == BuildType.dev.index) return 'Field';
    return 'Prod';
  }
}

class Environment {
  // Pre-defined value by "--dart-define"
  // .dev, .field and .prod
  static const APP_SUFFIX = String.fromEnvironment('Environment');

  // It got a bit complicated to make it a const value.
  static const BuildType buildType = (APP_SUFFIX == '.dev')
      ? BuildType.dev
      : (APP_SUFFIX == '.field')
          ? BuildType.field
          : BuildType.prod;

  static final Environment _instance = Environment._();
  factory Environment() => _instance;
  static Environment get instance => _instance;

  Environment._() {
    if (buildType == BuildType.prod) {
      GeLog.logLevel = LogLevel.error;
    } else {
      GeLog.logLevel = LogLevel.verbose;
    }
  }

  static const isDebugMode = kDebugMode;
  static const isReleaseMode = kReleaseMode;
  static const isProfileMode = kProfileMode;
}
*/
