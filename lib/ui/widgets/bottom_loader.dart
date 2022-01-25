import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app.dart';

class BottomLoader extends StatelessWidget {
  final bool showLoader;
  final VoidCallback? onTap;
  BottomLoader(this.showLoader, this.onTap);

  @override
  Widget build(BuildContext context) {
    return _loadMore();
  }

  Widget _loadMore() {
    return showLoader
        ? Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(),
                  ),
                  const SizedBox(width: 15),
                  Text(lang(Get.context!).loading),
                ],
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Center(child: Text(lang(Get.context!).loadMore))),
          );
  }
}
