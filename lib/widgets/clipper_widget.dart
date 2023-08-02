
import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path()
        ..lineTo(0, size.height)
        ..lineTo(size.width, size.height - 30)
        ..lineTo(size.width, 0)
        ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>true;

}