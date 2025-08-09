/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRatingWidget extends StatefulWidget {
  final int starCount;
  final double size; // Size of each star
  final String filledStarSvg; // Path to filled star SVG
  final String unfilledStarSvg; // Path to unfilled star SVG
  final double spacing; // Gap between stars

  const StarRatingWidget({
    super.key,
    this.starCount = 5,
    required this.filledStarSvg,
    required this.unfilledStarSvg,
    this.size = 24.0, // Default star size
    this.spacing = 8.0, // Default gap between stars
  });

  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  int currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount * 2 - 1, (index) {
        if (index % 2 == 0) {
          // Star item
          final starIndex = index ~/ 2;
          return GestureDetector(
            onTap: () {
              setState(() {
                currentRating = starIndex + 1;
              });
            },
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: SvgPicture.asset(
                starIndex < currentRating
                    ? widget.filledStarSvg // Show filled star
                    : widget.unfilledStarSvg, // Show unfilled star
                width: widget.size, // Explicit width
                height: widget.size, // Explicit height
              ),
            ),
          );
        } else {
          // Spacing
          return SizedBox(width: widget.spacing);
        }
      }),
    );
  }
}
*/
