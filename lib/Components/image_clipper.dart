import 'package:flutter/material.dart';

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const start = 200;
    const end = 30;
    final path = Path();
    path.lineTo(0, size.height - start);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - end);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
