import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/QR_screen/qr_send_money_screen.dart';

class ScanTheQrCodeScreen extends StatelessWidget {
  static const routeName = 'ScanTheQrCodeScreen';
  const ScanTheQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 24.h),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Text(
              'Get Help',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 239.h,
                width: 267.w,
                decoration: BoxDecoration(
                  color: const Color(0xffFFF3EE),
                  borderRadius: k15BorderRadius,
                  border: Border.all(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Scan The QR Code',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  svgAssets.check,
                  width: 20.w,
                ),
                SizedBox(
                  width: 9.w,
                ),
                Expanded(
                  child: Text(
                    'Align the QR Code within the frame and hold steady to scan.',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  svgAssets.check,
                  width: 20.w,
                ),
                SizedBox(
                  width: 9.w,
                ),
                Expanded(
                  child: Text(
                    'Make sure the QR Code is well-lit and in focus.',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(QrSendMoneyScreen.routeName);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Scan QR Code.',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
