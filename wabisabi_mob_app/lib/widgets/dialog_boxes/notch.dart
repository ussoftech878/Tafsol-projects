// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:wabisabi_mob_app/constants/assets.dart';

// // Example assets path for the tick icon
// // final String svgAssetsTick = 'assets/icons/tick.svg';

// void showPassResetDialogBox(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return Dialog(
//         // Give the dialog rounded corners
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//         // Prevent the circle from being clipped
//         child: Stack(
//           clipBehavior: Clip.none,
//           alignment: Alignment.topCenter,
//           children: [
//             // Main dialog content
//             Padding(
//               // Extra padding at the top to leave space for the circle
//               padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 24.h),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Title
//                   Text(
//                     'Great! your pin is set',
//                     style: GoogleFonts.ubuntu(
//                       textStyle: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.sp,
//                         color: const Color(0xff0E253A),
//                       ),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 12.h),

//                   // Subtitle
//                   Text(
//                     'Now you can pay for bill and transfer conveniently',
//                     style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                           color: Colors.grey,
//                         ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 24.h),

//                   // Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop(); // Close dialog
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orangeAccent,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.r),
//                         ),
//                       ),
//                       child: Text(
//                         'Okay, thank you!',
//                         style: GoogleFonts.ubuntu(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // The circular icon on top
//             Positioned(
//               top: -55.h, // Move the circle up
//               child: ClipOval(
//                 child: Container(
//                   // width: 91.w,
//                   // height: 60.w,
//                   decoration: BoxDecoration(
//                     // shape: BoxShape.circle,
//                     // border: Border.all(
//                     //   color: Colors.grey.withOpacity(0.5),
//                     //   width: 10.w,
//                     // ),
//                     // borderRadius: BorderRadius.all(Radius.elliptical(200, 300)),
//                     // border: Border.all(
//                     //   color: Colors.red,
//                     //   width: 20,
//                     // ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         blurRadius: 12,
//                         spreadRadius: 5,
//                         offset: Offset(-2, 7),
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: SvgPicture.asset(
//                       svgAssets.tick,
//                       width: 91.w,
//                       height: 91.h,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
