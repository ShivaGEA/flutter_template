import 'env.dart';

class UAT extends Environment {
  @override
  String name = BuildType.UAT.toString();

  @override
  BuildType get type => BuildType.UAT;

  @override
  String baseUrl = 'https://api.github.com';

  UAT._privateConstructor();
  static final Environment _instance = UAT._privateConstructor();
  static Environment get instance => _instance;
}
