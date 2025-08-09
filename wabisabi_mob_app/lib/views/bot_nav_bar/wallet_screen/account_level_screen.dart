import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/set_trans_limit_screen.dart';

class AccountLevelScreen extends StatelessWidget {
  static const routeName = 'AccountLevelScreen';
  const AccountLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 24.h),
        forceMaterialTransparency: true,
        title: const Text('Account Level & Limits'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Current Account Level',
              style: TextStyle(
                fontSize: 17.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
              decoration: BoxDecoration(
                color: Get.find<ThemeController>().themeMode.value ==
                        ThemeMode.dark
                    ? Colors.grey.shade500.withOpacity(0.5)
                    : const Color(0xffFFF3EE),
                borderRadius: k15BorderRadius,
                border: Border.all(
                  color: AppColors.kPrimaryColor,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    svgAssets.level,
                    width: 38.23.w,
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Level 1',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Monthly Limit 5,600.00',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Remaining Limits',
              style: TextStyle(
                fontSize: 18.5.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                  color: Get.find<ThemeController>().themeMode.value ==
                          ThemeMode.dark
                      ? Colors.grey.shade500.withOpacity(0.2)
                      : Color(0xffF5F9FE),
                  borderRadius: k15BorderRadius,
                  border: Border.all(
                    color: Get.find<ThemeController>().themeMode.value ==
                            ThemeMode.dark
                        ? AppColors.kPrimaryColor
                        : const Color(0xffB3B3B3),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sending',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daily',
                        style: TextStyle(),
                      ),
                      RichText(
                          text: TextSpan(
                              text: '\$50.00 / ',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                              children: [
                            TextSpan(
                              text: '\$100.00',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            )
                          ]))
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  LinearPercentIndicator(
                    padding: const EdgeInsets.all(0),
                    lineHeight: 4,
                    percent: 0.6,
                    barRadius: const Radius.circular(10),
                    progressColor: AppColors.kPrimaryColor,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Monthly',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      RichText(
                          text: TextSpan(
                              text: '\$50.00 / ',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                              children: [
                            TextSpan(
                              text: '\$100.00',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            )
                          ]))
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  LinearPercentIndicator(
                    padding: const EdgeInsets.all(0),
                    lineHeight: 4,
                    percent: 0.3,
                    barRadius: const Radius.circular(10),
                    progressColor: AppColors.kPrimaryColor,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Yearly',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      RichText(
                          text: TextSpan(
                              text: '\$50.00 / ',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                              children: [
                            TextSpan(
                              text: '\$100.00',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            )
                          ]))
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  LinearPercentIndicator(
                    padding: const EdgeInsets.all(0),
                    lineHeight: 4,
                    percent: 0.1,
                    barRadius: const Radius.circular(10),
                    progressColor: AppColors.kPrimaryColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
              decoration: BoxDecoration(
                color: Get.find<ThemeController>().themeMode.value ==
                        ThemeMode.dark
                    ? Colors.grey.shade500.withOpacity(0.2)
                    : AppColors.kScaffoldColor,
                borderRadius: k15BorderRadius,
                border: Border.all(
                  color: AppColors.kPrimaryColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'IBAN',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'GHY45551178884477',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SvgPicture.asset(
                        svgAssets.copy,
                        width: 18.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 50.h,
            // ),
            Spacer(),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Get.find<ThemeController>().themeMode.value ==
                                ThemeMode.dark
                            ? Colors.grey.shade500.withOpacity(0.2)
                            : Colors.transparent)),
                onPressed: () {
                  Get.toNamed(SetTransLimitScreen.routeName);
                },
                child: Text('Set Transaction Limit'),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Upgrade Account'),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
