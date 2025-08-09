import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';

//TODO: create info card

Widget infoCard({
  required String label,
  required String subLabel,
  VoidCallback? onTap,
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
        color: AppColors.orangeColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 3.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                    alignment: langController.language.value == "ar"
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: InkWell(
                        onTap: onTapIcon,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Icon(
                            Icons.cancel,
                            color: AppColors.whiteColor,
                            size: 20.w,
                          ),
                        ))),
              ],
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
                fontFamily: langController.fontFamily.value,
              ),
            ),
            SizedBox(height: 8.w),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                textAlign: TextAlign.center,
                subLabel,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteColor2,
                  fontFamily: langController.fontFamily.value,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    // Positioned(
    //   top: 8,
    //   right: 8,
    //   child: TopIcon ?? SizedBox.shrink(),
    // ),
  );
}
