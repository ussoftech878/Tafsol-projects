// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/bot_nav_bar.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/wallet_screens/wallet_transactions_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/widgets/wallet_tile.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';

class WalletScreen extends GetView<HomeScreenController> {
  static const routeName = 'WalletScreen';

  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;

    final hasBottomNotch = bottomPadding > 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        // toolbarHeight: 121.h,
        leadingWidth: 48.w,
        title: SafeArea(
          child: Text(
            'Wallet',
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: controller.languagecontroller.fontFamily.value,
                letterSpacing: 0.5,
                color: AppColors.kScaffoldColor),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 27).w,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              svgAssets.backArrow,
              color: AppColors.kScaffoldColor,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: 130.h,
                color: AppColors.kPrimaryColor,
              ),
              Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 27.w,right: 27.w, top: 10.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: SvgPicture.asset(
                        svgAssets.wallet_bg,
                        fit: BoxFit.contain,
                        // width: 348.w,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 35.h, // Adjust the vertical position as needed
                    left: 42.w,
                    // Align with horizontal padding
                    // right: 7.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Balance',style: TextStyle(
                          color: const Color(0xffBDFFE1),
                          fontWeight: FontWeight.w500,
                          fontFamily: controller
                              .languagecontroller.fontFamily.value,
                          fontSize: 16.sp,
                          height: 1.0
                        ),),
                        Text('BHD 14.35',
                          style: TextStyle(
                          color: const Color(0xffF6F6F6),
                          fontWeight: FontWeight.w600,
                          fontFamily: controller
                              .languagecontroller.fontFamily.value,
                            height: 1.2,
                            fontSize: 28.sp,
                        ),),

                        SizedBox(
                          height: 24.h,
                        ),
                        InkWell(
                          onTap: () async {
                            // Hide the bottom navigation bar
                            controller.toggleBottomNavVisibility(false);
                            // Wait for the bottom sheet to close
                            await BottomSheetManager.addFundsBottomSheet(
                                context);
                            // Show the bottom navigation bar again
                            controller.toggleBottomNavVisibility(true);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 7.w, bottom: 7.w, right: 7.w, left: 16.w),
                            decoration: BoxDecoration(
                                color: const Color(0xffBDFFE1),
                                borderRadius: BorderRadius.circular(100)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Add funds',
                                    style: TextStyle(
                                        color: AppColors.kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: controller
                                            .languagecontroller
                                            .fontFamily
                                            .value,
                                        fontSize: 15.sp)),
                                SizedBox(width: 16.w),
                                Icon(
                                  Icons.add_circle,
                                  color: AppColors.kPrimaryColor,
                                  size: 27.w,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 36.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent activity',
                    style: TextStyle(
                        color: const Color(0xff104D4D),
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontSize: 20.sp)),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: const WalletTransactionsScreen(),
                            withNavBar: true);
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: const Color(0xff104D4D),
                            fontWeight: FontWeight.w600,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                            fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    SvgPicture.asset(
                      svgAssets.arrowForward,
                      color: AppColors.forestColor,
                    )
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 24.h),
              children: [
                WalletTile(

                  'Wallet funded',
                  '+BHD 10.00',
                  SvgPicture.asset(
                    svgAssets.receive,
                    height: 34.h,
                  ),
                  TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.kPrimaryColor,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      fontWeight: FontWeight.w600),
                ),
                WalletTile(
                  'Wallet Payment',
                  '-BHD 2.99',
                  SvgPicture.asset(
                    svgAssets.sent,
                    height: 34.h,
                  ),
                  TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xffF16055),
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      fontWeight: FontWeight.w600),
                ),
                WalletTile(
                  'Order refund',
                  '+BHD 10.00',
                  SvgPicture.asset(
                    svgAssets.receive,
                    height: 34.h,
                  ),
                  TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.kPrimaryColor,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      fontWeight: FontWeight.w600),
                ),
                WalletTile(
                  bottomPadding: false,
                  'Amount sent',
                  '-BHD 2.99',
                  SvgPicture.asset(
                    svgAssets.sent,
                    height: 34.h,
                  ),
                  TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xffF16055),
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5.h,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(BotNavBar.routeName);
                      },
                      child: const Text('Explore Stores')),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: hasBottomNotch?80.h:0.h ),
          )
        ],
      ),
    );
  }
}
