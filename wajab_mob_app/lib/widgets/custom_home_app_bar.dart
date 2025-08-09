// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/constants/constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/notification_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/wallet_screens/wallet_screen.dart';

import '../view/bot_nav_bar/home_screen/location_screen.dart';

class CustomHomeAppBar extends GetView<Languagecontroller>
    implements PreferredSizeWidget {
  final bool showActionButtons;
  final bool showLeadingButton;
  const CustomHomeAppBar(
      {super.key,
      required this.showActionButtons,
      required this.showLeadingButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 128.h,
      leadingWidth: 400.w,
      backgroundColor: AppColors.kPrimaryColor,
      leading: showLeadingButton
          ? Padding(
              padding: EdgeInsets.only(right: 27.w, left: 27.w, bottom: 0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(MapLocationScreen.routeName);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      svgAssets.location,
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(
                      width: 3.8.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      child: VerticalDivider(
                        color: const Color(0xffF6F6F6).withOpacity(0.5),
                      ),
                    ),
                    k1wSizedBox,
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Manama'.tr,
                                  style: TextStyle(
                                      color: AppColors.kScaffoldColor,
                                      fontSize: 16.sp,
                                      fontFamily: controller.fontFamily.value,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                width: 2.2.w,
                              ),
                              SvgPicture.asset(
                                svgAssets.arrow,
                                width: 22.w,
                                height: 17.h,
                              )
                            ],
                          ),
                          Text('Within 4.1 km'.tr,
                              style: TextStyle(
                                color: const Color(0xffBDFFE1),
                                fontSize: 14.sp,
                                fontFamily: controller.fontFamily.value,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : null,
      actions: showActionButtons
          ? [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 25.w, end: 25.w),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: const NotificationScreen(),
                              withNavBar: true);
                        },
                        child: SvgPicture.asset(
                          svgAssets.noti,
                          width: 40.w,
                          height: 40.h,
                        )),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: const WalletScreen(), withNavBar: true);
                          // Get.toNamed(WalletScreen.routeName);
                        },
                        child: SvgPicture.asset(
                          svgAssets.fold,
                          width: 40.w,
                          height: 40.h,
                        )),
                  ],
                ),
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
