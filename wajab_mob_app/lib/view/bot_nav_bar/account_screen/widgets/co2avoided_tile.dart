import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class CO2AvoidedTile extends GetView<Languagecontroller> {
  final bool showDivider;

  const CO2AvoidedTile({super.key, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                svgAssets.smartphone,
                width: 40.w,
              ),
              SizedBox(width: 14.w),
              SizedBox(
                width: 181.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Smartphone charges'.tr,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.kPrimaryColor,
                          fontFamily: controller.fontFamily.value,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4.h),
                    Text('Equal to charging your smartphone X times.',
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: controller.fontFamily.value,
                            color: const Color(0xff868787),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                '2,000',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: controller.fontFamily.value,
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          if (showDivider)
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const Divider(
                  color: Color(0xffE2E5E8),
                  thickness: 1.6,
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
