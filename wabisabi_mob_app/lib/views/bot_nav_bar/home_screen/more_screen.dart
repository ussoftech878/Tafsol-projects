import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/view_participant.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/quick_pay_screen.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = 'MoreScreen';
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            svgAssets.viewBeneficiary,
                            width: 60.w,
                            height: 60.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('View Beneficiary',
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(QuickPayScreen.routeName);
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              svgAssets.quickpay,
                              width: 60.w,
                              height: 60.h,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text('Quick Pay',
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            svgAssets.payContact,
                            width: 60.w,
                            height: 60.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Pay Contact',
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            svgAssets.userAdd,
                            width: 60.w,
                            height: 60.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Invite a Friend',
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.kBlackText,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            svgAssets.transaction,
                            width: 60.w,
                            height: 60.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Transactions',
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Get.toNamed(MoreScreen.routeName);
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              svgAssets.more,
                              width: 60.w,
                              height: 60.h,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text('Scheduled payments',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.ubuntu(
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
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed(MoreScreen.routeName);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            svgAssets.more,
                            width: 60.w,
                            height: 60.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Recurring payments',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          svgAssets.userAdd,
                          width: 60.w,
                          height: 60.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Invite a Friend',
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.kBlackText,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
