import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/constants/constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';

class TermsConditionsScreen extends GetView<AccountScreenController> {
  static const routeName = 'TermsConditionsScreen';
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48.w,
        title: Text('Terms & Conditions'.tr),
        leading: Padding(
          padding: EdgeInsets.only(
              left: controller.languagecontroller.language == 'en' ? 27.w : 0,
              right: controller.languagecontroller.language == 'en' ? 0 : 20.w),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              controller.languagecontroller.language == 'en'
                  ? svgAssets.backArrow
                  : svgAssets.front_Arrow,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 27.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Wajba! By using our app, you agree to the following terms and conditions. Please read them carefully.',
                style: TextStyle(
                    fontSize: 15.6.sp,
                    height: 1.6,
                    color: const Color(0xff252525),
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500),
              ),
              k5hSizedBox,
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(
                    fontSize: 17.2.sp,
                    color: AppColors.kPrimaryColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                'By downloading, accessing, or using Wajba, you acknowledge that you have read, understood, and agree to these terms. If you do not agree, do not use the app.',
                style: TextStyle(
                    fontSize: 15.5.sp,
                    height: 1.6,
                    color: const Color(0xff4F4F4F),
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500),
              ),
              k1hSizedBox,
              const Divider(
                color: Color(0xffE2E5E8),
              ),
              SizedBox(
                height: 0.9.h,
              ),
              Text(
                '2. User Accounts',
                style: TextStyle(
                    fontSize: 17.2.sp,
                    color: AppColors.kPrimaryColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                'By downloading, accessing, or using Wajba, you acknowledge that you have read, understood, and agree to these terms. If you do not agree, do not use the app.',
                style: TextStyle(
                    fontSize: 15.5.sp,
                    height: 1.6,
                    color: const Color(0xff4F4F4F),
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500),
              ),
              k1hSizedBox,
              const Divider(
                color: Color(0xffE2E5E8),
              ),
              SizedBox(
                height: 0.9.h,
              ),
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(
                    fontSize: 17.2.sp,
                    color: AppColors.kPrimaryColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                'By downloading, accessing, or using Wajba, you acknowledge that you have read, understood, and agree to these terms. If you do not agree, do not use the app.',
                style: TextStyle(
                    fontSize: 15.5.sp,
                    height: 1.6,
                    color: const Color(0xff4F4F4F),
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500),
              ),
              k1hSizedBox,
              const Divider(
                color: Color(0xffE2E5E8),
              ),
              SizedBox(
                height: 0.9.h,
              ),
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(
                    fontSize: 17.2.sp,
                    color: AppColors.kPrimaryColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                'By downloading, accessing, or using Wajba, you acknowledge that you have read, understood, and agree to these terms. If you do not agree, do not use the app.',
                style: TextStyle(
                    fontSize: 15.5.sp,
                    height: 1.6,
                    color: const Color(0xff4F4F4F),
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500),
              ),
              k1hSizedBox,
              const Divider(
                color: Color(0xffE2E5E8),
              ),
              SizedBox(
                height: 0.9.h,
              ),
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(
                    fontSize: 17.2.sp,
                    color: AppColors.kPrimaryColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                'By downloading, accessing, or using Wajba, you acknowledge that you have read, understood, and agree to these terms. If you do not agree, do not use the app.',
                style: TextStyle(
                    fontSize: 15.5.sp,
                    height: 1.6,
                    color: const Color(0xff4F4F4F),
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500),
              ),
              k1hSizedBox,
              const Divider(
                color: Color(0xffE2E5E8),
              ),
              SizedBox(
                height: 0.9.h,
              ),
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(
                    fontSize: 17.2.sp,
                    color: AppColors.kPrimaryColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                'By downloading, accessing, or using Wajba, you acknowledge that you have read, understood, and agree to these terms. If you do not agree, do not use the app.',
                style: TextStyle(
                    fontSize: 15.5.sp,
                    height: 1.6,
                    color: const Color(0xff4F4F4F),
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500),
              ),
              k1hSizedBox,
              const Divider(
                color: Color(0xffE2E5E8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
