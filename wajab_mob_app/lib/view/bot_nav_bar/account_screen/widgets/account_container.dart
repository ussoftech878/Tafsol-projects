import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class AccountCard extends GetView<Languagecontroller> {
  final Widget svg;
  final String title;
  final String value;
  final String unit;
  const AccountCard({
    super.key,
    required this.svg,
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
      height: 138.w,
      width: 170.w,
      decoration: BoxDecoration(
        color: const Color(0xffDEE8E7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: svg,
          ),
          // SizedBox(
          //   height: 19.h,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: controller.fontFamily.value,
                    fontSize: 13.sp),
              ),
              // SizedBox(
              //   height: 0.h,
              // ),
              Row(
                children: [
                  Text(
                    value,
                    style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: controller.fontFamily.value,
                        fontSize: 27.sp),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    unit,
                    style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: controller.fontFamily.value,
                        fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
