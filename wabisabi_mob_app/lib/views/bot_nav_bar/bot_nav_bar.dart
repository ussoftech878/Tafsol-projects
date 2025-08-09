// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/bot_nav_bar_controller.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/QR_screen/scan_the_qr_code_screen.dart';

class BotNavBar extends GetView<BotNavBarController> {
  static const routeName = 'BotNavBar';

  // final BotNavBarController navController = Get.put(BotNavBarController());

  const BotNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        // backgroundColor: AppColors.kScaffoldColor,
        floatingActionButton: Visibility(
          visible: !isKeyboardVisible,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(ScanTheQrCodeScreen.routeName);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: SvgPicture.asset(
                svgAssets.qr,
                height: 70.w,
                width: 70.w,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() => Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 60,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: BottomAppBar(
                height: 80.h,
                color: Get.find<ThemeController>().themeMode.value ==
                        ThemeMode.dark
                    ? AppColors.kDarkFieldFillColor
                    : AppColors.kWhiteColor,
                shape: const CircularNotchedRectangle(),
                notchMargin: 15.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.changePage(0);
                      },
                      child: SvgPicture.asset(
                        svgAssets.home,
                        width: 24.w,
                        height: 24.h,
                        color: controller.currentIndex.value == 0
                            ? AppColors.kPrimaryColor
                            : Get.find<ThemeController>().themeMode.value ==
                                    ThemeMode.dark
                                ? AppColors.kWhiteColor
                                : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.changePage(1);
                      },
                      child: SvgPicture.asset(
                        svgAssets.wallet,
                        width: 24.w,
                        height: 24.h,
                        color: controller.currentIndex.value == 1
                            ? AppColors.kPrimaryColor
                            : Get.find<ThemeController>().themeMode.value ==
                                    ThemeMode.dark
                                ? AppColors.kWhiteColor
                                : Colors.black,
                      ),
                    ),
                    SizedBox(width: 12.w), // Space for the floating button
                    GestureDetector(
                      onTap: () {
                        controller.changePage(2);
                      },
                      child: SvgPicture.asset(
                        svgAssets.message,
                        width: 24.w,
                        height: 24.h,
                        color: controller.currentIndex.value == 2
                            ? AppColors.kPrimaryColor
                            : Get.find<ThemeController>().themeMode.value ==
                                    ThemeMode.dark
                                ? AppColors.kWhiteColor
                                : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.changePage(3);
                      },
                      child: SvgPicture.asset(
                        width: 24.w,
                        height: 24.h,
                        svgAssets.sm2,
                        color: controller.currentIndex.value == 3
                            ? AppColors.kPrimaryColor
                            : Get.find<ThemeController>().themeMode.value ==
                                    ThemeMode.dark
                                ? AppColors.kWhiteColor
                                : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )),
        body: Obx(() => controller.pages[controller.currentIndex.value]),
      );
    });
  }
}
