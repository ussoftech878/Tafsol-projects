import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/widgets/show_dialog_box.dart';

import '../../../../widgets/days_left_badge.dart';

class ProductContainer2 extends GetView<HomeScreenController> {
  final bool isFavScreen;
  const ProductContainer2({this.isFavScreen = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 36.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7.r),
            child: Container(
              height: 140.2.h,
              width: double.infinity,
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
                  ),
                  // Color overlay
                  Container(
                    color: const Color(0xff000000).withOpacity(0.3),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.h, right: 15.w),
                      child: GestureDetector(
                        onTap: () {
                          removeFromFavDialogBox(context);
                        },
                        child: SvgPicture.asset(
                          isFavScreen ? svgAssets.Vector : svgAssets.favorite,
                          fit: BoxFit.scaleDown,
                          color: const Color(0xffBDFFE1),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 15.w),
                        child: isFavScreen ? const SizedBox() : const DaysLeftBadge()),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 15.w, bottom: 19.h),
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
                                          .languagecontroller.fontFamily.value,
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
                                          .languagecontroller.fontFamily.value,
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
            height: 8.h,
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
                      text: 'BHD ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.kPrimaryColor,
                          fontSize: 12.sp,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w600),
                      children: [
                    TextSpan(
                      text: '1.99+',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                          ),
                    ),
                  ])),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Pick up Tomorrow 2:00am - 5:00am',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14.4.sp,
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
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 6.w),
              Container(
                color: const Color(0XFFB3B3B3).withOpacity(0.5),
                height: 14.h,
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
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}

