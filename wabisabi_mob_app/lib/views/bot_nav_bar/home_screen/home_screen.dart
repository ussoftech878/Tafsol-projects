// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/bot_nav_bar_controller.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/models/response/user_details_response.dart';
import 'package:wabisabi_mob_app/utils/custom_print.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/notification_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/view_participant.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/chatbot_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/more_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/quick_pay_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/send_money_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/transactions_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/view_beneficiary_Screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/widgets/transaction_tile.dart';
import 'package:wabisabi_mob_app/widgets/custom_appbar.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/verification_check.dart';

class HomeScreen extends GetView<BotNavBarController> {
  static const routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const CustomAppbar(),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    right: 15.w,
                    top: 62.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            svgAssets.logo2,
                            width: 147.w,
                            height: 22.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(ChatbotScreen.routeName);
                                  },
                                  child: SvgPicture.asset(
                                    svgAssets.robot3,
                                    width: 27.w,
                                    height: 27.h,
                                  )),
                              SizedBox(
                                width: 15.w,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(NotificationScreen.routeName);
                                  },
                                  child: SvgPicture.asset(
                                    svgAssets.noti,
                                    width: 24.w,
                                    height: 24.h,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 52.h,
                      ),
                      Text('Total Balance',
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                            fontSize: 19.sp,
                            height: 0,
                            color: Colors.white,
                          ))),
                      Text('\$50.00',
                          style: GoogleFonts.archivo(
                              textStyle: TextStyle(
                                  fontSize: 50.sp,
                                  height: 0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 167.w,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: k5BorderRadius),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 12.sp,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text('Add Money',
                                          style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: AppColors.kBlackText),
                                          ))
                                    ],
                                  )),
                            ),
                            Spacer(),
                            SizedBox(
                              height: 40.h,
                              width: 167.w,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(SendMoneyScreen.routeName);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.kBlackText,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: k5BorderRadius),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        svgAssets.wallet2,
                                        color: Colors.white,
                                        height: 12.h,
                                        width: 12.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text('Send Money',
                                          style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white),
                                          ))
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 40.h, left: 10.w, right: 10.w),
                        child: Material(
                          elevation: 5,
                          color: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: k10BorderRadius,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Get.find<ThemeController>()
                                              .themeMode
                                              .value ==
                                          ThemeMode.dark
                                      ? Border.all(
                                          color: AppColors.kPrimaryColor
                                              .withOpacity(0.6),
                                          width: 1)
                                      : null,
                                  color: Get.find<ThemeController>()
                                              .themeMode
                                              .value ==
                                          ThemeMode.dark
                                      ? Colors.grey.shade500.withOpacity(0.1)
                                      : Colors.white,
                                  borderRadius: k10BorderRadius,
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey.withOpacity(0.2),
                                  //     spreadRadius: 3,
                                  //     blurRadius: 8,
                                  //     offset: const Offset(0, 5),
                                  //   ),
                                  // ],
                                ),
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 11.3.w, vertical: 15.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  ColoredPrint.green(controller
                                                      .userDetailsResponse
                                                      .user!
                                                      .pageIndex
                                                      .toString());
                                                  controller.userDetailsResponse
                                                              .user!.pageIndex ==
                                                          5
                                                      ? Get.toNamed(
                                                          ViewBeneficiaryScreen
                                                              .routeName)
                                                      : showVerificationDialogBox(
                                                          context);
                                                },
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                      svgAssets.viewBeneficiary,
                                                      width: 45.w,
                                                      height: 45.h,
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text('View Beneficiary',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                            fontSize: 13.sp,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      QuickPayScreen.routeName);
                                                  if (kDebugMode) {
                                                    print(
                                                        '---------------------');
                                                  }
                                                },
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                      svgAssets.quickpay,
                                                      width: 45.w,
                                                      height: 45.h,
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text('Quick Pay',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                            fontSize: 13.sp,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                      SendMoneyScreen.routeName,
                                                      arguments: {
                                                        'isPayContactScreen':
                                                            true
                                                      });
                                                },
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                      svgAssets.payContact,
                                                      width: 45.w,
                                                      height: 45.h,
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text('Pay Contact',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                            fontSize: 13.sp,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(ViewParticipant
                                                      .routeName);
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      svgAssets.sm4,
                                                      width: 45.w,
                                                      height: 45.h,
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text('Smart Contract',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                            fontSize: 13.sp,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(TransactionsScreen
                                                      .routeName);
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      svgAssets.transaction,
                                                      width: 45.w,
                                                      height: 45.h,
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text('Transactions',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                            fontSize: 13.sp,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                      MoreScreen.routeName);
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      svgAssets.more,
                                                      width: 45.w,
                                                      height: 45.h,
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text('More',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                            fontSize: 13.sp,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Material(
                elevation: 5,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: k10BorderRadius,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 450.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Get.find<ThemeController>().themeMode.value ==
                                ThemeMode.dark
                            ? Border.all(
                                color: AppColors.kPrimaryColor.withOpacity(0.6),
                                width: 1)
                            : null,
                        color: Get.find<ThemeController>().themeMode.value ==
                                ThemeMode.dark
                            ? Colors.grey.shade500.withOpacity(0.1)
                            : Colors.white,
                        borderRadius: k10BorderRadius,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Latest Transactions',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                )),
                            Expanded(
                                child: ListView.builder(
                                    padding: EdgeInsets.only(top: 20.h),
                                    itemCount: 20,
                                    itemBuilder: (context, index) {
                                      return const TransactionTile();
                                    }))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.only(bottom: 40.h),
      //   child: FloatingActionButton.large(
      //     onPressed: () {
      //       Get.toNamed(ChatbotScreen.routeName);
      //     },
      //     elevation: 0,
      //     focusElevation: 0,
      //     highlightElevation: 0,
      //     hoverElevation: 0,
      //     disabledElevation: 0,
      //     focusColor: Colors.transparent,
      //     hoverColor: Colors.transparent,
      //     foregroundColor: Colors.transparent,
      //     backgroundColor: Colors.transparent,
      //     child: SvgPicture.asset(
      //       svgAssets.robot2,
      //       height: 67.86.h,
      //       width: 67.87.w,
      //     ),
      //   ),
    );
  }
}
