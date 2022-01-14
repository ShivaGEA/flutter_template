import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 15),
          Text(lang.loading),
        ],
      ),
    );
  }
}
