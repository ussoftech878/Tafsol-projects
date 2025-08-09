import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/widgets/custom_app_bar.dart';

import '../../controllers/LanguageController.dart';

class OtpScreen extends StatelessWidget {
  static const routeName = 'OtpScreen';
  final String routeToGo;
  const OtpScreen({super.key, required this.routeToGo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "", onPressed: () => Get.back()),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Email Confirmation'.tr,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Enter the confirmation code sent via email to '.tr,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    
                    TextSpan(
                        text: "example@email.com",
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ))
                  ]),
            ),
            SizedBox(
              height: 36.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(svgAssets.Icon_Leading),
                k2wSizedBox,
                Text('Edit Email'.tr,
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
            SizedBox(
              height: 24.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // controller: controller.otpController,
                length: 4, // Number of OTP fields

                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffADADAD)),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffADADAD)),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black
                      ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffADADAD)),
                  ),
                ),
                showCursor: false,
              ),
            ),
            SizedBox(
              height: 24.w,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'You will receive the code within '.tr,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                        text: ' 00:18',
                        style: TextStyle(
                          color: AppColors.orangeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        )),
                    TextSpan(
                      text: 'seconds'.tr,
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 82.w,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(routeToGo);
                    },
                    child: Text('Continue'.tr)))
          ],
        ),
      ),
    );
  }
}
