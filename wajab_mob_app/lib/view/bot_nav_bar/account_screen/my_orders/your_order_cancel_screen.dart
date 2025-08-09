import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';

import '../../../../widgets/custom_back_button_app_bar.dart';

class YourOrderCancelScreen extends GetView<AccountScreenController> {
  static const routeName = 'CancelOrderScreen';
  const YourOrderCancelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(title: 'Your Order'.tr),
      body: Padding(
        padding: EdgeInsets.only(left: 27.w, right: 27.w, top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imageAssets.joe,
                width: 65.w,
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            Center(
              child: Text(
                'Order Confirmation'.tr + '#XQZF',
                style: TextStyle(
                    color: const Color(0xff252525),
                    fontSize: 16.sp,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Text(
                'Joe & The Juice',
                style: TextStyle(
                    color: AppColors.forestColor,
                    fontSize: 24.sp,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: const Color(0xffF5E4E3),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text('Order Cancelled'.tr,
                    style: TextStyle(
                        color: const Color(0xffF16055),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value)),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 42.h,
                    ),
                    Text(
                      'Refund process'.tr,
                      style: TextStyle(
                          color: AppColors.forestColor,
                          fontSize: 18.sp,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          svgAssets.ordertick,
                          width: 16.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Cancellation request received'.tr,
                          style: TextStyle(
                              color: AppColors.forestColor,
                              fontSize: 14.sp,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      padding: EdgeInsets.symmetric(vertical: 0.3.w),
                      height: 28.h,
                      width: 0.3.w,
                      color: Colors.black38,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          svgAssets.ordertick,
                          width: 16.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Amount refunded to wallet'.tr,
                          style: TextStyle(
                              color: AppColors.forestColor,
                              fontSize: 14.sp,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    const Divider(
                      color: Color(0xffB3B3B3),
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      'Overview'.tr,
                      style: TextStyle(
                          color: AppColors.forestColor,
                          fontSize: 18.sp,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          svgAssets.clock,
                          width: 16.w,
                        ),
                        SizedBox(
                          width: 7.33.w,
                        ),
                        Text(
                          '21/03/2024 - 2:13 ' + 'AM'.tr,
                          style: TextStyle(
                              color: AppColors.forestColor,
                              fontSize: 15.sp,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          svgAssets.locationicon,
                          width: 16.w,
                        ),
                        SizedBox(
                          width: 7.33.w,
                        ),
                        Text(
                          'The Walk, Riffa'.tr,
                          style: TextStyle(
                              color: AppColors.forestColor,
                              fontSize: 15.sp,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const Divider(
                      color: Color(0xffB3B3B3),
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Order details'.tr,
                      style: TextStyle(
                          color: AppColors.forestColor,
                          fontSize: 18.sp,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sandwich Bag'.tr + '(x2)',
                          style: TextStyle(
                              color: const Color(0xff868787),
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          '3.99',
                          style: TextStyle(
                              color: const Color(0xff868787),
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Pastries Bag'.tr + '(x1)',
                          style: TextStyle(
                              color: const Color(0xff868787),
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          '1.99',
                          style: TextStyle(
                              color: const Color(0xff868787),
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Total'.tr,
                          style: TextStyle(
                              color: const Color(0xff252525),
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            children: [
                              Text(
                                'BHD'.tr,
                                style: TextStyle(
                                    color: const Color(0xff252525),
                                    fontFamily: controller
                                        .languagecontroller.fontFamily.value,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                ' 5.98 ',
                                style: TextStyle(
                                    color: const Color(0xff252525),
                                    fontFamily: controller
                                        .languagecontroller.fontFamily.value,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 27.w,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
