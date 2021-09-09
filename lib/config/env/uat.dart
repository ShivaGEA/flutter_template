import 'env.dart';

class UAT extends Environment {
  @override
  String name = BuildType.UAT.toString();
  @override
  String baseUrl = "https://api.github.com";

  UAT._privateConstructor();
  static final UAT _instance = UAT._privateConstructor();
  static UAT get instance => _instance;
}
