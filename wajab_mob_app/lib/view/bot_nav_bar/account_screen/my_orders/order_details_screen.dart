import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/constants/constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/bot_nav_bar.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';

import '../../../../widgets/custom_back_button_app_bar.dart';

class OrderDetailsScreen extends GetView<AccountScreenController> {
  static const routeName = 'OrderDetailsScreen';
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(title: 'Your Order'.tr),
      body: Padding(
        padding:
            EdgeInsets.only(left: 27.w, right: 27.w, top: 28.h, bottom: 40.h),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    imageAssets.joe,
                    width: 65.w,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    'Order Confirmation'.tr + ' #XQZF',
                    style: TextStyle(
                        color: const Color(0xff252525),
                        fontSize: 16.sp,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: Text(
                    'Joe & The Juice',
                    style: TextStyle(
                        color: AppColors.forestColor,
                        fontSize: 24.sp,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 19.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: const Color(0xffDEE8E7),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Text('Order Completed'.tr,
                        style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: controller
                                .languagecontroller.fontFamily.value)),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 48.h,
                        ),
                        Center(
                          child: Text(
                            'Rate this order'.tr,
                            style: TextStyle(
                                color: const Color(0xff868787),
                                fontFamily: controller
                                    .languagecontroller.fontFamily.value,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InkWell(
                          onTap: () {
                            BottomSheetManager.rateOrderBottomSheet(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(svgAssets.emptystar),
                              k2wSizedBox,
                              SvgPicture.asset(svgAssets.emptystar),
                              k2wSizedBox,
                              SvgPicture.asset(svgAssets.emptystar),
                              k2wSizedBox,
                              SvgPicture.asset(svgAssets.emptystar),
                              k2wSizedBox,
                              SvgPicture.asset(svgAssets.emptystar),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        const Divider(
                          color: Color(0xffB3B3B3),
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Overview'.tr,
                          style: TextStyle(
                              color: AppColors.forestColor,
                              fontSize: 18.sp,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              svgAssets.clock,
                              width: 16.w,
                              fit: BoxFit.fitWidth,
                            ),
                            k3wSizedBox,
                            Text(
                              '21/03/2024 - 2:13 ' + 'AM'.tr,
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
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              svgAssets.locationicon,
                              width: 16.w,
                              fit: BoxFit.fitWidth,
                            ),
                            k3wSizedBox,
                            Text(
                              'The Walk, Riffa'.tr,
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
                          height: 14.h,
                        ),
                        const Divider(
                          color: Color(0xffB3B3B3),
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          'Order details'.tr,
                          style: TextStyle(
                              color: AppColors.forestColor,
                              fontSize: 18.sp,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Sandwich Bag'.tr + ' (x2)',
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
                              'Pastries Bag'.tr + ' (x1)',
                              style: TextStyle(
                                  color: const Color(0xff868787),
                                  fontFamily: controller
                                      .languagecontroller.fontFamily.value,
                                  fontSize: 15.3.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              '1.99',
                              style: TextStyle(
                                  color: const Color(0xff868787),
                                  fontFamily: controller
                                      .languagecontroller.fontFamily.value,
                                  fontSize: 15.3.sp,
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
                                            .languagecontroller
                                            .fontFamily
                                            .value,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    ' 5.99',
                                    style: TextStyle(
                                        color: const Color(0xff252525),
                                        fontFamily: controller
                                            .languagecontroller
                                            .fontFamily
                                            .value,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 120.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(BotNavBar.routeName);
                    },
                    child: Text('Back to Home'.tr)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
