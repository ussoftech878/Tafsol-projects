import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';

// void showPinSetDialogBox(BuildContext context) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//             backgroundColor: AppColors.kScaffoldColor,
//             child: Padding(
//               padding: EdgeInsets.only(
//                   left: 20.w, right: 20.h, bottom: 24.h, top: 24.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Center(
//                     child: SvgPicture.asset(
//                       svgAssets.tick,
//                       width: 91.w,
//                     ),
//                   ),
//                   k2hSizedBox,
//                   Text('Great! your pin is set',
//                       style: TextStyle(
//                         color: Color(0xff0E253A),
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.bold,
//                       )),
//                   SizedBox(
//                     height: 12.h,
//                   ),
//                   Text(
//                       textAlign: TextAlign.center,
//                       'Now you can pay for bill and transfer conveniently',
//                       style:
//                           TextStyle(color: Color(0xff63809A), fontSize: 14.sp)),
//                   SizedBox(
//                     height: 12.h,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Get.toNamed(VerifyProfileScreen.routeName);
//                         },
//                         child: const Text('Okay, thank you!')),
//                   )
//                 ],
//               ),
//             ));
//       });
// }

// void showPassResetDialogBox(BuildContext context) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//             backgroundColor: AppColors.kScaffoldColor,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Center(
//                     child: SvgPicture.asset(svgAssets.tick),
//                   ),
//                   SizedBox(
//                     height: 12.h,
//                   ),
//                   Text(
//                     'Password Updated',
//                     style: GoogleFonts.ubuntu(
//                         textStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.sp,
//                       color: Color(0xff0E253A),
//                     )),
//                   ),
//                   SizedBox(
//                     height: 12.h,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     'Now you can pay for bill and transfer conveniently',
//                     style: Theme.of(context)
//                         .textTheme
//                         .labelLarge!
//                         .copyWith(color: AppColors.kTextGreyColor),
//                   ),
//                   SizedBox(
//                     height: 12.h,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Get.toNamed(VerifyProfileScreen.routeName);
//                         },
//                         child: const Text('Proceed To App')),
//                   )
//                 ],
//               ),
//             ));
//       });
// }

void showLocationDialogBox(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                  // child: SvgPicture.asset(svgAssets.tick),
                  ),
              k2hSizedBox,
              Text(
                'Your password has been reset',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              k1hSizedBox,
              Text(
                textAlign: TextAlign.center,
                'Your password has been successfully reset and can now log in with your new password.',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.kTextGreyColor),
              ),
              k3hSizedBox,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Got it!')),
              )
            ],
          ),
        ));
      });
}

// void showTransactionSuccessfullDialogBox(BuildContext context) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//             backgroundColor: AppColors.kScaffoldColor,
//             child: Padding(
//               padding: EdgeInsets.only(
//                   left: 10.w, right: 10.w, bottom: 15.h, top: 15.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Center(
//                     child: SvgPicture.asset(
//                       svgAssets.tick,
//                       width: 91.w,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   Text('Transaction Successful',
//                       style: TextStyle(
//                           fontSize: 20.sp,
//                           color: AppColors.kBlackText,
//                           fontWeight: FontWeight.bold)),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     'John Doe',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: AppColors.kBlackText,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 7.h,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     'Bank Name - 14555477884',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: AppColors.kBlackText,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 7.h,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     'Money Transferred',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: AppColors.kBlackText,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 7.h,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     '\$50.00',
//                     style: TextStyle(
//                       fontSize: 20.sp,
//                       color: AppColors.kPrimaryColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12.h,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     'To',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.kBlackText,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12.h,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     'John Doe Jr.',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: AppColors.kBlackText,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 7.h,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     'Bank Name - 14555477884',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: AppColors.kBlackText,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 7.h,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     '12/12/2024 - 12:00 pm',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: AppColors.kBlackText,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ElevatedButton(
                  //           onPressed: () {
                  //             Get.back();
                  //           },
                  //           child: const Text('Share')),
                  //     ),
                  //     SizedBox(
                  //       width: 10.w,
                  //     ),
                  //     Expanded(
                  //       child: OutlinedButton(
                  //           onPressed: () {
                  //             Get.back();
                  //           },
                  //           child: const Text('Back')),
                  //     ),
                  //   ],
                  // )
//                 ],
//               ),
//             ));
//       });
// }
