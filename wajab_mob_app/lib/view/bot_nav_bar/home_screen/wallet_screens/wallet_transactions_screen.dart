import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/widgets/wallet_tile.dart';

class WalletTransactionsScreen extends GetView<HomeScreenController> {
  static const routeName = 'WalletTransactionsScreen';
  const WalletTransactionsScreen({super.key});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      // Update the selected date in the controller
      Get.find<HomeScreenController>().selectedDate.value =
      "${pickedDate.day}-${"Feburary"}-${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;
    final hasBottomNotch = bottomPadding > 0;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 48.w,
        title: const Text(
          'Wallet Transactions',
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 27).w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              svgAssets.backArrow,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 27.w, right: 27.w, top: 56.h, bottom: hasBottomNotch?70.h:27.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.r),
                  border: Border.all(color: const Color(0xffE2E5E8)),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(svgAssets.calender),
                    SizedBox(width: 16.w),
                    Obx(() => Text(
                          Get.find<HomeScreenController>().selectedDate.value,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xff868787),
                              fontWeight: FontWeight.w500,
                              fontFamily: Get.find<HomeScreenController>()
                                  .languagecontroller
                                  .fontFamily
                                  .value),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 48.h),
            Text('Activity',
                style: TextStyle(
                    color: const Color(0xff104D4D),
                    fontWeight: FontWeight.w600,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontSize: 20.sp)),
            SizedBox(
              height: 24.h,
            ),
            Flexible(
              child: ListView(
                children: [
                  WalletTile(
                    'Wallet funded',
                    '+BHD 10.00',
                    SvgPicture.asset(svgAssets.receive, width: 34.w),
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
                    SvgPicture.asset(svgAssets.sent, width: 34.w),
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
                    SvgPicture.asset(svgAssets.receive, width: 34.w),
                    TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.kPrimaryColor,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w600),
                  ),
                  WalletTile(
                    'Amount sent',
                    '-BHD 2.99',
                    SvgPicture.asset(svgAssets.sent, width: 34.w),
                    TextStyle(
                        fontSize: 15.sp,
                        color: const Color(0xffF16055),
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w600),
                  ),
                  WalletTile(
                    'Wallet funded',
                    '+BHD 10.00',
                    SvgPicture.asset(svgAssets.receive, width: 34.w),
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
                    SvgPicture.asset(svgAssets.sent, width: 34.w),
                    TextStyle(
                        fontSize: 15.sp,
                        color: const Color(0xffF16055),
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 1.2.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(svgAssets.receive, width: 34.w),
                            SizedBox(
                              width: 14.w,
                            ),
                            Text(
                              'Order refund',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color(0xff4F4F4F),
                                  fontFamily: controller
                                      .languagecontroller.fontFamily.value,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              '+BHD 10.00',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color(0xff4F4F4F),
                                  fontFamily: controller
                                      .languagecontroller.fontFamily.value,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
