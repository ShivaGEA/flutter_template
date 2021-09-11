import 'env.dart';

class QA extends Environment {
  @override
  String name = BuildType.QA.toString();
  @override
  String baseUrl = "https://api.github.com";

  QA._privateConstructor();
  static final QA _instance = QA._privateConstructor();
  static QA get instance => _instance;
}
