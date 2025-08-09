import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/constants/constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/bot_nav_bar.dart';

void showPasswordResetDialogBox(BuildContext context) {
  Languagecontroller controller = Get.put(Languagecontroller());
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 37.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset(
                  svgAssets.tick,
                  width: 92.4,
                ),
              ),
              k2hSizedBox,
              Text(
                'Your password has been resets',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    fontFamily: controller.fontFamily.value,
                    color: const Color(0xff252525)),
              ),
              k1hSizedBox,
              Text(
                textAlign: TextAlign.center,
                'Your password has been successfully reset and can now log in with your new password.',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: const Color(0xff252525).withOpacity(0.5),
                    fontSize: 14.sp,
                    fontFamily: controller.fontFamily.value),
              ),
              k3hSizedBox,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Got it!')),
              )
            ],
          ),
        ));
      });
}

void showLocationDialogBox(BuildContext context) {
  Languagecontroller controller = Get.put(Languagecontroller());
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 37.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset(
                  svgAssets.tick,
                  width: 92.4,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Your password has been reset'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      fontFamily: controller.fontFamily.value,
                      color: const Color(0xff252525))),
              SizedBox(
                height: 10.h,
              ),
              Text(
                  textAlign: TextAlign.center,
                  'Your password has been successfully reset and can now log in with your new password.'
                      .tr,
                  style: TextStyle(
                      color: const Color(0xff252525).withOpacity(0.5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: controller.fontFamily.value)),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Got it'.tr)),
              )
            ],
          ),
        ));
      });
}

void showPaymentFailedDialogBox(BuildContext context) {
  Languagecontroller controller = Get.put(Languagecontroller());

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 37.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset(
                  svgAssets.failed,
                  width: 92.w,
                ),
              ),
              SizedBox(height: 24.h),
              Text('Payment Failed',
                  style: TextStyle(
                      color: const Color(0xff252525),
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp)),
              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.center,
                'Something went wrong, please try the payment at another time.',
                style: TextStyle(
                    color: const Color(0xffB3B3B3),
                    fontFamily: controller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Got it!',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: controller.fontFamily.value,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              )
            ],
          ),
        ));
      });
}

void showRatingDialogBox(BuildContext context) {
  Languagecontroller controller = Get.put(Languagecontroller());

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 37.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset(svgAssets.ratingdialogsvg),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Thank you!'.tr,
                  style: TextStyle(
                      color: const Color(0xff252525),
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp)),
              SizedBox(
                height: 24.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'We will use your feedback to constantly improve our services.'
                    .tr,
                style: TextStyle(
                    color: const Color(0xff252525).withOpacity(0.5),
                    fontFamily: controller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Got it!'.tr)),
              )
            ],
          ),
        ));
      });
}

void showDeleteCardDialogBox(BuildContext context) {
  Languagecontroller controller = Get.put(Languagecontroller());

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 19.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset(
                  svgAssets.deletecard,
                  width: 92.4.w,
                ),
              ),
              k2hSizedBox,
              Text('Delete Card?'.tr,
                  style: TextStyle(
                      color: const Color(0xff252525),
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp)),
              SizedBox(
                height: 10.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'Are you sure you want to remove VISA card ending with'.tr +
                    ' **** 4374?',
                style: TextStyle(
                    color: const Color(0xffB3B3B3),
                    fontFamily: controller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Remove Card'.tr)),
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Never mind'.tr,
                  style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp),
                ),
              ),
            ],
          ),
        ));
      });
}

void showMessageSentDialogBox(BuildContext context) {
  Languagecontroller controller = Get.put(Languagecontroller());

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Padding(
              padding: const EdgeInsets.all(27).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      svgAssets.tick,
                      width: 92.w,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text('Your message has been sent!'.tr,
                      style: TextStyle(
                          color: const Color(0xff252525),
                          fontFamily: controller.fontFamily.value,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.5.sp)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'We will do our best to get back to you at the soonest. Remember to check your spam folder in some cases.'
                        .tr,
                    style: TextStyle(
                        color: const Color(0xff252525).withOpacity(0.5),
                        fontFamily: controller.fontFamily.value,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.5.sp),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(BotNavBar.routeName);
                        },
                        child: Text('Got it!'.tr)),
                  )
                ],
              ),
            ));
      });
}

void showCancelOrderDialogBox(BuildContext context) {
  Languagecontroller controller = Get.put(Languagecontroller());

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 19.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset(
                  svgAssets.cancelOrder,
                  width: 92.4,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Cancel order?'.tr,
                  style: TextStyle(
                      color: const Color(0xff252525),
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp)),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Text(
                  textAlign: TextAlign.center,
                  'Are you sure you want to cancel your order with'.tr +
                      'Joe & The Juice - The Walk?',
                  style: TextStyle(
                      color: const Color(0xffB3B3B3),
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Yes, cancel'.tr)),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text('No, don’t cancel'.tr,
                  style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp)),
            ],
          ),
        ));
      });
}

void removeFromFavDialogBox(BuildContext context) {
  Languagecontroller controller = Get.put(Languagecontroller());

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 19.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset(
                  svgAssets.cancelOrder,
                  width: 92.4,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Remove from favorites?',
                  style: TextStyle(
                      color: const Color(0xff252525),
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp)),
              SizedBox(
                height: 10.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'Are you sure you want to remove “Costa Coffee - Hamala” from your favorites?',
                style: TextStyle(
                    color: const Color(0xffB3B3B3),
                    fontFamily: controller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Remove Favorite')),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text('Nevermind',
                  style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp)),
            ],
          ),
        ));
      });
}
