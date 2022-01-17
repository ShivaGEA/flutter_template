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
          const CircularProgressIndicator(),
          const SizedBox(height: 15),
          Text(lang.loading),
        ],
      ),
    );
  }
}
