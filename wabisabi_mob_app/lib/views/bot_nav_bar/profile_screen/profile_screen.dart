import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/Terms_&_conditions_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/change_pass_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/faqs_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/privacy_policy_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/widgets/wallet_tile.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/logout.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = 'ProfileScreen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              k5hSizedBox,
              Text(
                'Account Settings',
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Account info, Settings & More',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Account',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(ChangePassScreen.routeName);
                },
                child: WalletTile(
                    svg: SvgPicture.asset(svgAssets.pincode, width: 50.w),
                    title: 'Change Account PIN'),
              ),
              SizedBox(
                height: 10.h,
              ),
              WalletTile(
                  svg: SvgPicture.asset(svgAssets.debit, width: 50.w),
                  title: 'Link Debit Card'),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'General',
                style:
                    TextStyle(fontSize: 16.8.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15.h,
              ),
              Tile(
                  svg: SvgPicture.asset(svgAssets.notii, width: 50.w),
                  title: 'Notification',
                  subTitle:
                      "Enable alerts for transactions, promotions, and security updates",
                  switchButton: Switch(
                    value: false,
                    onChanged: (value) {
                      //  Get.find<ThemeController>().toggleTheme();
                    },
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.kPrimaryColor,
                    inactiveThumbColor: Colors.white,
                    trackOutlineColor:
                        MaterialStateProperty.all(Color(0xffD6D6D6)),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Tile(
                  svg: SvgPicture.asset(svgAssets.fingerprint, width: 50.w),
                  title: 'Enable Biometric Login',
                  switchButton: Switch(
                    value: false,
                    onChanged: (value) {
                      // value = !value;
                      // Get.find<ThemeController>().toggleTheme();
                    },
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.kPrimaryColor,
                    inactiveThumbColor: Colors.white,
                    trackOutlineColor:
                        MaterialStateProperty.all(Color(0xffD6D6D6)),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Tile(
                svg: SvgPicture.asset(svgAssets.darkmode, width: 50.w),
                title: 'Dark Mode',
                switchButton: Obx(() {
                  return Switch(
                    value: Get.find<ThemeController>().themeMode.value ==
                            ThemeMode.dark
                        ? true
                        : false,
                    onChanged: (value) {
                      Get.find<ThemeController>().toggleTheme();
                    },
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.kPrimaryColor,
                    inactiveThumbColor: Colors.white,
                    trackOutlineColor:
                        MaterialStateProperty.all(Color(0xffD6D6D6)),
                  );
                }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Help',
                style:
                    TextStyle(fontSize: 16.8.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(FAQsScreen.routeName);
                },
                child: WalletTile(
                    svg: SvgPicture.asset(svgAssets.faq, width: 50.w),
                    title: 'FAQs'),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Info',
                style:
                    TextStyle(fontSize: 16.8.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(PrivacyPolicyScreen.routeName);
                },
                child: WalletTile(
                    svg: SvgPicture.asset(svgAssets.privacy, width: 50.w),
                    title: 'Privacy Policy'),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(TermsConditionScreen.routeName);
                },
                child: WalletTile(
                    svg: SvgPicture.asset(svgAssets.terms, width: 50.w),
                    title: 'Terms & Conditions'),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () async {
                  showLogoutDialogBox(context);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(svgAssets.terms, width: 50.w),
                    SizedBox(width: 15.w),
                    Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 15.sp, color: Color(0xffFD2727)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class Tile extends StatelessWidget {
  final Widget svg;
  final String title;
  final String? subTitle;
  final Widget? switchButton;

  const Tile({
    super.key,
    required this.svg,
    required this.title,
    this.subTitle,
    this.switchButton,
  });

  // bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            svg,
            SizedBox(width: 15.w),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: TextStyle(
                          fontSize: 10.sp, color: AppColors.kBlackText),
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      softWrap: true,
                    ),
                ],
              ),
            ),
            Spacer(),
            Transform.scale(
              scale: 0.7.w,
              child: switchButton,
            )
          ],
        ),
        SizedBox(height: 10.h),
        Divider(),
        SizedBox(height: 10.h),
      ],
    );
  }
}
