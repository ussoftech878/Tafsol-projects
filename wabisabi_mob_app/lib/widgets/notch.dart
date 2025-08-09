import 'dart:ui';

import 'package:flutter/material.dart';

class NotchClipper extends CustomClipper<Path> {
  final double notchRadius;

  NotchClipper({this.notchRadius = 30});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left corner
    path.moveTo(0, 0);

    // Go to the middle-left of the notch
    path.lineTo((size.width / 2) - notchRadius, 0);

    // Draw an arc forming the notch at the top center
    path.arcToPoint(
      Offset((size.width / 2) + notchRadius, 0),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    // Continue to top-right corner
    path.lineTo(size.width, 0);

    // Then down the right edge
    path.lineTo(size.width, size.height);

    // Then along the bottom edge
    path.lineTo(0, size.height);

    // Close the shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
