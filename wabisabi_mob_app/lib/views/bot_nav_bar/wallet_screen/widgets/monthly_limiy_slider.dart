// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'package:wabisabi_mob_app/constants/assets.dart';
// import 'package:wabisabi_mob_app/constants/colors_constants.dart';

// class CustomSlider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SfSlider(
//       min: 0.0,
//       max: 500.0,
//       value: 300.0,
//       onChanged: (dynamic newValue) {
//         // Update the value
//       },
//       activeColor: AppColors.kPrimaryColor,
//       inactiveColor: Colors.grey.shade300,

//       // Custom Thumb Shape
//       thumbShape: _CustomThumbShape(),

//       // Custom Thumb Icon
//       thumbIcon: SvgPicture.asset(
//         svgAssets.handle, // Your custom SVG file
//         width: 30,  // Adjust if needed
//         height: 30, // Adjust if needed
//         fit: BoxFit.contain, // Prevents any unwanted scaling
//       ),
//     );
//   }
// }

// // Custom Thumb Shape to paint the custom SVG
// class _CustomThumbShape extends SfThumbShape {
//   @override
//   void paint(PaintingContext context, Offset center,
//       {required RenderBox parentBox,
//       required RenderBox? child,
//       required SfSliderThemeData themeData,
//       SfRangeValues? currentValues,
//       dynamic currentValue,
//       required Paint? paint,
//       required Animation<double> enableAnimation,
//       required TextDirection textDirection,
//       required SfThumb? thumb}) {
//     // Load the SVG asset
//     final svg = SvgPicture.asset(
//       svgAssets.handle, // Your custom SVG file
//       width: 30,  // Adjust if needed
//       height: 30, // Adjust if needed
//       fit: BoxFit.contain, // Prevents any unwanted scaling
//     );

//     // Convert the SVG widget to a picture
//     final svgPicture = svg.picture;

//     // Draw the SVG at the thumb's center position
//     context.canvas.save();
//     context.canvas.translate(center.dx - 15, center.dy - 15); // Adjust for centering
//     svgPicture(context.canvas, Offset.zero);
//     context.canvas.restore();
//   }
// }