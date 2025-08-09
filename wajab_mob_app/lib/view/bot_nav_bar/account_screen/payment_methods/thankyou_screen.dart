import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/my_orders/order_details_screen.dart';

class ThankyouScreen extends GetView<AccountScreenController> {
  static const routeName = 'ThankyouScreen';
  const ThankyouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 27.h, left: 27.w, right: 27.w, top: 40.h),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Spacer(),
                SizedBox(
                  height: 90.h,
                ),
                SvgPicture.asset(
                  svgAssets.thankyou,
                  width: 215.w,
                ),
                SizedBox(
                  height: 44.h,
                ),
                Text(
                  'You just saved a meal!'.tr,
                  style: TextStyle(
                      color: const Color(0xffBDFFE1),
                      fontSize: 26.5.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Thank you for helping reduce food\nwaste and making a change'
                      .tr,
                  style: TextStyle(
                      color: AppColors.kScaffoldColor,
                      fontSize: 15.4.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value),
                ),
                SizedBox(
                  height: 55.h,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        svgAssets.insta,
                        width: 51.w,
                      ),
                      SizedBox(
                        width: 13.w,
                      ),
                      SvgPicture.asset(
                        svgAssets.fb,
                        width: 51.w,
                      ),
                      SizedBox(
                        width: 13.w,
                      ),
                      SvgPicture.asset(
                        svgAssets.twitter,
                        width: 51.w,
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                SizedBox(
                  height: 100.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffBDFFE1),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                      ),
                      onPressed: () {
                        Get.offNamed(OrderDetailsScreen.routeName);
                      },
                      child: Text(
                        'Continue'.tr,
                        style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
