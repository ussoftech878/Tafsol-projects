import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';

//TODO: Check flipcards

Widget cardBuild({
  required SvgPicture icon,
  required String label,
  required String subLabel,
  VoidCallback? onTap,
  required bool show_info,
  Color? cardColor,
  VoidCallback? onTapIcon,
}) {
  Languagecontroller langController = Get.put(Languagecontroller());
  return GestureDetector(
    onTap: onTap ?? () {},
    child: Container(
      height: 118.w,
      width: 164.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: cardColor ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              show_info
                  ? Align(
                      alignment: langController.language.value == "ar"
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: InkWell(
                          onTap: onTapIcon,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.w, top: 8.w),
                            child: SvgPicture.asset(
                              svgAssets.card_info,
                              width: 20.w,
                            ),
                          )))
                  : SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.only(top: 12.w),
                child: Center(child: icon),
              ),
            ],
          ),
          SizedBox(height: 10.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
              fontFamily: langController.fontFamily.value,
            ),
          ),
          SizedBox(height: 4.w),
          Padding(
            padding: EdgeInsets.only(bottom: 0.w),
            child: Text(
              textAlign: TextAlign.center,
              subLabel,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyColor,
                fontFamily: langController.fontFamily.value,
              ),
            ),
          ),
        ],
      ),
    ),
    // Positioned(
    //   top: 8,
    //   right: 8,
    //   child: TopIcon ?? SizedBox.shrink(),
    // ),
  );
}
