import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class BottomLoader extends StatelessWidget {
  final bool showLoader;
  final VoidCallback? onTap;
  BottomLoader(this.showLoader, this.onTap);

  @override
  Widget build(BuildContext context) => _loadMore();

  Widget _loadMore() {
    return showLoader
        ? Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(width: 15),
                  Text(lang.loading),
                ],
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
                padding: EdgeInsets.all(20),
                child: Center(child: Text(lang.loadMore))),
          );
  }
}
