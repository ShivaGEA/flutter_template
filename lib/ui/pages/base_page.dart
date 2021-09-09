import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BasePage<T extends GetxController> extends GetView<T> {
  void showToast() {}

  void showSnackBar(String title, String message,
      {snackPosition: SnackPosition.TOP}) {
    Get.snackbar(title, message, snackPosition: snackPosition);
  }
}

abstract class BasePageState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) => onPageBuild(context);
  Widget onPageBuild(BuildContext context);

  void showSnackBar(String title, String message,
      {snackPosition: SnackPosition.TOP}) {
    Get.snackbar(title, message, snackPosition: snackPosition);
  }
}
