import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/bot_nav_bar.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

import '../constants/colors_constants.dart';
import '../widgets/custom_back_button_app_bar.dart';

class AllowNotificationScreen extends GetView<Languagecontroller> {
  static const routeName = 'AllowNotificationScreen';
  const AllowNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(
        title: 'Notifications'.tr,
        actionsButton: [
          Padding(
              padding: EdgeInsetsDirectional.only(end: 27.w),
              child: LanguageButton())
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  SizedBox(height: 165.h,),
          const Spacer(),
          Center(
              child: SvgPicture.asset(
            svgAssets.noti3,
            width: 176.w,
          )),
          SizedBox(
            height: 40.h,
          ),
          Text(
            textAlign: TextAlign.center,
            'Stay Updated!'.tr,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                fontFamily: controller.fontFamily.value),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            textAlign: TextAlign.center,
            'Want to stay in the know? Get alerts for\norder updates, new stores and exclusive\ndeals, right when they happen.'
                .tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14.sp,
                color: AppColors.kTextGreyColor,
                fontFamily: controller.fontFamily.value,
                fontWeight: FontWeight.w500),
          ),
          Spacer(),
          //SizedBox(height: 180.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(BotNavBar.routeName);
                  },
                  child: Text('Allow Notifications'.tr)),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 45.h),
            child: Text(
              textAlign: TextAlign.center,
              'Maybe Later'.tr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kTextGreyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
