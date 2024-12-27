import 'package:flutter/material.dart';

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var Size(:width, :height) = size;
    var path = Path();
    path.moveTo(width * 0.35, height * 0.1);
    path.lineTo(width, height * 0.1);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.quadraticBezierTo(0, height * 0.95, width * 0.25, height * 0.95);
    path.lineTo(width * 0.7, height * 0.95);

    path.quadraticBezierTo(
        width * 0.85, height * 0.95, width * 0.85, height * 0.90);
    path.quadraticBezierTo(
        width * 0.84, height * 0.85, width * 0.7, height * 0.85);
    path.lineTo(width * 0.35, height * 0.85);

    path.quadraticBezierTo(
        width * 0.124, height * 0.85, width * 0.125, height * 0.75);

    path.lineTo(width * 0.125, height * 0.20);

    path.quadraticBezierTo(
        width * 0.12, height * 0.1, width * 0.35, height * 0.1);

    // path.quadraticBezierTo(
    //     width * 0.9, height * 0.8, width * 0.75, height * 0.8);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
