import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/repositories/git_repository_impl.dart';
import '../../../domain/datasources/network/response/feature_response.dart';

class HomePageController extends GetxController {
  final repo = Get.find<GitRepositoryImpl>();

  var label = 'init'.obs;
  var count = 0;
  var list = <Feature>[].obs;
  var sampleData = <Feature>[].obs;

  void onClick() {
    //label.value = 'action clicked';
    count++;
    label.value = '$count actions performed';
    gitApiCall();
  }

  void gitApiCall() async {
    /* var dio = Dio();
    var response = await dio.get('https://api.github.com/repositories');
    print(response.data.toString());*/

    final resp = await repo.features('GTD65EBSJ0WS', 'benefitcopy', 1);
    resp.fold((l) => handlerResp(l), (r) => null);
  }

  void handlerResp(FeatureResponse data) {
    list.value = data.features;
    debugPrint('==>${data.features}');
  }
}
