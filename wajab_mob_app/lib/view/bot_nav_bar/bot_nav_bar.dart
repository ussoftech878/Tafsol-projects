// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/bot_nav_bar_controller.dart';

// ignore: must_be_immutable
class BotNavBar extends StatelessWidget {
  BotNavBarController controller = Get.put(BotNavBarController());

  static const routeName = 'BotNavBar';

  BotNavBar({super.key});

  List<PersistentBottomNavBarItem> _navBarItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAssets.fillHome,
                width: 24.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.kPrimaryColor,
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        inactiveIcon: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAssets.home2,
                width: 24.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xffB3B3B3),
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAssets.fillShop,
                width: 24.w,
                color: AppColors.kPrimaryColor,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Browse',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.kPrimaryColor,
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        inactiveIcon: Padding(
          padding: EdgeInsets.only(
            top: 15.h,

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAssets.shop,
                width: 24.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Browse',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xffB3B3B3),
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAssets.fillHeart,
                width: 24.w,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.kPrimaryColor,
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        inactiveIcon:  Padding(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAssets.homeUnFilledHeart,
                width: 24.w,
                color: const Color(0xffB3B3B3),

              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xffB3B3B3),
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAssets.profile,
                width: 24.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Account',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.kPrimaryColor,
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        inactiveIcon: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAssets.account,
                width: 24.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Account',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xffB3B3B3),
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;
    final hasBottomNotch = bottomPadding > 0;

    return Scaffold(
        extendBody: true,
        body: Container(
      color: Colors.yellow,
      child: Obx( () {
          return PersistentTabView(
            context,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            confineToSafeArea: !hasBottomNotch,
            isVisible: controller.vissible.value,
            screens: controller.pages,
            items: _navBarItems(context),
            navBarHeight: 90.h,
            navBarStyle: NavBarStyle.simple, // Customize your desired style
           backgroundColor:  Colors.white,
            onItemSelected: (index) {
              controller.changePage(index);
            },
          );
        }
      ),
    ));
  }
}
