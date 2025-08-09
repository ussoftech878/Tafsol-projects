import 'package:flutter/cupertino.dart';

class CustomClippers extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 6.5; // Adjust the radius as needed

    // Move to the top center of the container
    path.moveTo(size.width / 2.9, 0);

    // Draw a semi-circle on the top center
    path.arcToPoint(
      Offset(size.width / 2 + radius, 0),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Draw the rest of the rectangle
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width / 2 - radius, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
