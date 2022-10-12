import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String url;
  final double size;
  CircleImage({required this.url, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage: NetworkImage(url),
      backgroundColor: Colors.transparent,
    );
  }
}
