import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';

import '../../../../controllers/bot_nav_bar_controller.dart';

class MoneySavedTile extends GetView<Languagecontroller> {
  final Widget svg;
  final String title;
  final String value;
  const MoneySavedTile(
      {super.key, required this.svg, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BotNavBarController botNavBarController= Get.find();
        botNavBarController.vissible.value = false;
      BottomSheetManager.notificationDetailBottomSheet(context)
          .whenComplete(() {
          botNavBarController.vissible.value = true;});
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        child: Column(
          children: [
            Row(
              children: [
                svg,
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.kPrimaryColor,
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: controller.fontFamily.value,
                      color: AppColors.kPrimaryColor,
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
