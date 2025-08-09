// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';

import 'days_left_badge.dart';

class ProductContainer extends GetView<HomeScreenController> {
  const ProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BottomSheetManager.storeDetailBottomSheet(context);
      },
      child: Container(
        margin: EdgeInsets.only(right: 24.w),
        constraints: BoxConstraints(maxWidth: 265.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7.r),
              child: Container(
                height: 140.w,
                width: 265.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image as background
                    Image.asset(
                      imageAssets.product,
                      fit: BoxFit.cover,
                      width: 265.w,
                    ),
                    // Color overlay
                    Container(
                      color: const Color(0xff000000).withOpacity(0.3),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.toggleFav();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.w, right: 15.w),
                            child: SvgPicture.asset(
                              controller.isFav.value
                                  ? svgAssets.homeFillHeart
                                  : svgAssets.homeUnFilledHeart,
                              width: 24.w,
                              color: const Color(0xffBDFFE1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.only(top: 15.w, left: 15.w),
                          child: const DaysLeftBadge()),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 15.w, bottom: 19.w),
                          child: Row(
                            children: [
                              Image.asset(
                                imageAssets.joe,
                                width: 40.w,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Joe & The Juice',
                                      style: TextStyle(
                                        color: AppColors.kScaffoldColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        fontFamily: controller
                                            .languagecontroller
                                            .fontFamily
                                            .value,
                                      )),
                                  // SizedBox(
                                  //   height: 6.h,
                                  // ),
                                  Text('Riffa',
                                      style: TextStyle(
                                        color: AppColors.kScaffoldColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        fontFamily: controller
                                            .languagecontroller
                                            .fontFamily
                                            .value,
                                      )),
                                ],
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Surprise Bag',
                    style: TextStyle(
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        color: const Color(0xff252525),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500)),
                RichText(
                    text: TextSpan(
                        text: 'BHD '.tr,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.kPrimaryColor,
                            fontSize: 12.sp,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                            fontWeight: FontWeight.w600),
                        children: [
                      TextSpan(
                        text: '1.99+'.tr,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                            ),
                      ),
                    ])),
              ],
            ),
            SizedBox(
              height: 3.w,
            ),
            Text(
              'Pick up Tomorrow 2:00am - 5:00am'.tr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 13.sp,
                  color: const Color(0xff868787),
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  svgAssets.staricon,
                  width: 16.w,
                ),
                SizedBox(width: 1.5.w),
                Text(
                  '4.9',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kPrimaryColor,
                      fontSize: 14.sp,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 6.w),
                Container(
                  color: const Color(0XFFB3B3B3).withOpacity(0.5),
                  height: 14.w,
                  width: 1,
                ),
                SizedBox(width: 6.w),
                SvgPicture.asset(svgAssets.locationicon, width: 16.w),
                SizedBox(width: 1.5.w),
                Text(
                  '1.9 km',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff104D4D),
                      fontSize: 14.sp,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
