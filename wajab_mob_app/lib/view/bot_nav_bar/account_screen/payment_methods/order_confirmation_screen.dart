import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/bot_nav_bar.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';

import '../../../../widgets/custom_back_button_app_bar.dart';

class OrderConfirmationScreen extends GetView<AccountScreenController> {
  static const routeName = 'OrderConfirmationScreen';
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(
        isBackButton: false,
        title: 'Your Order'.tr,
        actionsButton: [
          Padding(
            padding: const EdgeInsets.only(right: 27).w,
            child: GestureDetector(
              onTap: () {
                Get.offAllNamed(BotNavBar.routeName);
              },
              child: SvgPicture.asset(
                svgAssets.home2,
                width: 24.w,
                color: const Color(0xff252525),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 27.w, right: 27.w, top: 25.h, bottom: 40.h),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.asset(
                    imageAssets.joe,
                    width: 65.w,
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'Order Confirmation'.tr + '#XQZF',
                      style: TextStyle(
                          color: const Color(0xff252525),
                          fontSize: 16.sp,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Center(
                    child: Text(
                      'Joe & The Juice',
                      style: TextStyle(
                          color: AppColors.forestColor,
                          fontSize: 24.sp,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 19.w, vertical: 4.5.h),
                      decoration: BoxDecoration(
                        color: const Color(0xffEBEBEB),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text('Pending Pick-Up'.tr,
                          style: TextStyle(
                              color: const Color(0xff868787),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value)),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  Text(
                    'Pick-up details'.tr,
                    style: TextStyle(
                        color: AppColors.forestColor,
                        fontSize: 18.sp,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        svgAssets.clock,
                        width: 16.w,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        'Pick-Up Today at'.tr +
                            ' 2:00 ' 'AM'.tr +
                            ' - ' +
                            ' 5:00 ' +
                            'AM'.tr,
                        style: TextStyle(
                            color: AppColors.forestColor,
                            fontSize: 14.sp,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
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
                        width: 6.w,
                      ),
                      Text(
                        'The Walk, Riffa'.tr,
                        style: TextStyle(
                            color: AppColors.forestColor,
                            fontSize: 14.sp,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
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
                        'Sandwich Bag'.tr + ' (x2)',
                        style: TextStyle(
                            color: const Color(0xff868787),
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '3.99',
                        style: TextStyle(
                            color: const Color(0xff868787),
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
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
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '1.99',
                        style: TextStyle(
                            color: const Color(0xff868787),
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
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
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
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
                              '5.99',
                              style: TextStyle(
                                  color: const Color(0xff252525),
                                  fontFamily: controller
                                      .languagecontroller.fontFamily.value,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  const Divider(
                    color: Color(0xffB3B3B3),
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        BottomSheetManager.troubleWithOrderBottomSheet(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: const Color(0xffEBEBEB),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              svgAssets.questionMark,
                              width: 16.sp,
                            ),
                            const SizedBox(
                              width: 4.67,
                            ),
                            Text('Trouble with the order?'.tr,
                                style: TextStyle(
                                    color: AppColors.kPrimaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: controller
                                        .languagecontroller.fontFamily.value)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        BottomSheetManager.collectOrderBottomSheet(context);
                      },
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('12:10:59 ',
                                style: TextStyle(
                                  color: const Color(0xffBDFFE1),
                                  fontSize: 16,
                                  fontFamily: controller
                                      .languagecontroller.fontFamily.value,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text('to pick up'.tr,
                                style: TextStyle(
                                  color: const Color(0xffBDFFE1),
                                  fontSize: 16,
                                  fontFamily: controller
                                      .languagecontroller.fontFamily.value,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
