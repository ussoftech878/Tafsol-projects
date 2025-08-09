import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/allow_notification_screen.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

import '../constants/colors_constants.dart';
import '../widgets/custom_back_button_app_bar.dart';

class LocationScreen extends GetView<Languagecontroller> {
  static const routeName = 'LocationScreen';
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(
        title: 'Location'.tr,
        actionsButton: [
          Padding(
                         padding: EdgeInsetsDirectional.only(end: 27.w),
 child: LanguageButton())
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: SvgPicture.asset(
            svgAssets.location2,
            // width: 263.w,
          )),
          SizedBox(
            height: 40.h,
          ),
          Text(
            textAlign: TextAlign.center,
            'Where would you like to\nfind your meal deals?'.tr,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: controller.fontFamily.value,
                ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            textAlign: TextAlign.center,
            'Pick your area so we can match you with\nlocal meal deals.'.tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14.sp,
                color: AppColors.kTextGreyColor,
                fontFamily: controller.fontFamily.value,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AllowNotificationScreen.routeName);
                  },
                  child: Text('Use My Current Location'.tr)),
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
