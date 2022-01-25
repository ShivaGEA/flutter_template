import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/config/localization/language.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 15),
          Text(lang(Get.context!).loading),
        ],
      ),
    );
  }
}
