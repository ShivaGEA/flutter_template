import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/ui/pages/base_page.dart';
import '../../../domain/datasources/network/response/feature_response.dart';
import 'home_page_controller.dart';

class HomePage extends BasePage<HomePageController> {
  final _controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    _controller.gitApiCall();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _body(),
    );
  }

  Widget _body() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Obx(() => Text(_controller.label.value)),
          Expanded(child: _list())
        ],
      );

  Widget _list() => Obx(() {
        debugPrint('Ui list: ${_controller.list.length}');

        return Container(
          child: _controller.list.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _controller.list.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      _listItem(_controller.list[index]))
              : const Text('Empty List'),
        );
      });

  Widget _listItem(Feature value) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Text(
          '${value.data}',
          maxLines: 3,
        ));
  }
}
