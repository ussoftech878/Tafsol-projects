import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';

import '../../../../widgets/custom_back_button_app_bar.dart';

class FAQsScreen extends GetView<AccountScreenController> {
  static const routeName = 'FAQsScreen';
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(title: 'FAQs'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Frequently Asked Questions'.tr,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  color: AppColors.forestColor),
            ),
            SizedBox(
              height: 10.h,
            ),
            Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                expandedAlignment: Alignment.topLeft,
                showTrailingIcon: false,
                minTileHeight: 0,
                title: Text(
                  'What is Wajba?'.tr,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                children: <Widget>[
                  Text(
                    'Lorem ipsum answer.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      color: const Color(0xff868787),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xffE2E5E8),
            ),
            Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                expandedAlignment: Alignment.topLeft,
                showTrailingIcon: false,
                minTileHeight: 0,
                title: Text(
                  'How do the ratings work?'.tr,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                children: <Widget>[
                  Text(
                    'Lorem ipsum answer.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      color: const Color(0xff868787),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xffE2E5E8),
            ),
            Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                expandedAlignment: Alignment.topLeft,
                showTrailingIcon: false,
                minTileHeight: 0,
                title: Text(
                  'Why are the meals affordable?'.tr,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                children: <Widget>[
                  Text(
                    'Valid till December 12, 2024',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      color: const Color(0xff868787),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
