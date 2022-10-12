import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/datasources/network/datasource/poll_datasource_impl.dart';
import '../../../domain/datasources/database/entities/poll_repo.dart';

class PollController extends GetxController {
  final pollDataSource = Get.find<PollDataSourceImpl>();
  var polls = <Poll>[].obs;

  @override
  void onInit() {
    debugPrint('init=> ');
    super.onInit();
    pollDataSource.repositories().then((value) => value.fold((l) {
          polls.value = l;
        }, (r) {}));
  }
}
