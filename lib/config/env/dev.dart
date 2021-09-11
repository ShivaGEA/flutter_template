import 'env.dart';

class DEV extends Environment {
  @override
  String name = BuildType.DEV.toString();

  @override
  String baseUrl = "https://api.github.com";

  DEV._privateConstructor();
  static final DEV _instance = DEV._privateConstructor();
  static DEV get instance => _instance;
}
