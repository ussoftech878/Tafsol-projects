import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/constants/routes.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';

class CustomAppBarExample extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Function() onPressed;
  CustomAppBarExample({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final Languagecontroller languagecontroller = Get.put(Languagecontroller());
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 176.w,
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.w),
                  bottomRight: Radius.circular(24.w)),
              child: SvgPicture.asset(
                svgAssets.custom_bar_background,
                fit: BoxFit.cover,
              ),
            )),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 20.w, 16.w, 13.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: languagecontroller.language.value == "ar"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: InkWell(
                        onTap: onPressed,
                        child: SvgPicture.asset(
                          languagecontroller.language.value == 'ar'
                              ? svgAssets.arab_white_back
                              : svgAssets.back_white,
                          width: 8.w,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 11.w,
                    ),
                    Text(
                      'Create a new account'.tr,
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: languagecontroller.fontFamily.value),
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      title.tr,
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: languagecontroller.fontFamily.value),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(145);
}
