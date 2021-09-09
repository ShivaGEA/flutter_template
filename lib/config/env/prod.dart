import 'env.dart';

class PROD extends Environment {
  @override
  String name = BuildType.PROD.toString();
  @override
  String baseUrl = "https://api.github.com";

  PROD._privateConstructor();
  static final PROD _instance = PROD._privateConstructor();
  static PROD get instance => _instance;
}
