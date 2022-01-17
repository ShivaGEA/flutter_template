import 'env.dart';

class QA extends Environment {
  @override
  String name = BuildType.QA.toString();

  @override
  BuildType get type => BuildType.QA;

  @override
  String baseUrl = 'https://api.github.com';

  QA._privateConstructor();
  static final Environment _instance = QA._privateConstructor();
  static Environment get instance => _instance;
}
