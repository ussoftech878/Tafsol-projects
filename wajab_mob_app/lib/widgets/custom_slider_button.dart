import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

import '../view/bot_nav_bar/account_screen/payment_methods/thankyou_screen.dart';

class MySliderButton extends StatefulWidget {
  const MySliderButton({super.key});

  @override
  _MySliderButtonState createState() => _MySliderButtonState();
}

class _MySliderButtonState extends State<MySliderButton> {
  bool isSlidToEnd = false; // Track whether the button is at the end position
  Languagecontroller controller = Get.put(Languagecontroller());
  @override
  Widget build(BuildContext context) {
    return HorizontalSlidableButton(
      width: double.infinity,
      buttonWidth: 55.w,
      height: 60.h,
      color: isSlidToEnd
          ? AppColors.kPrimaryColor
          : const Color(0XFFE2E5E8), // Background color changes
      dismissible: false,
      label: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SvgPicture.asset(
            svgAssets.button,
            width: 52.w,
            height: 52.h,
          ),
        ),
      ),
      child: Center(
        child: Text(
          'Slide to collect'.tr,
          style: TextStyle(
            fontFamily: controller.fontFamily.value,
            color: isSlidToEnd
                ? AppColors.kScaffoldColor
                : AppColors.kPrimaryColor, // Text color changes
            fontWeight: FontWeight.w600,
            fontSize: 16.4.sp,
          ),
        ),
      ),
      onChanged: (position) {
        setState(() {
          isSlidToEnd = position == SlidableButtonPosition.end;
          Get.toNamed(ThankyouScreen.routeName);
        });
      },
    );
  }
}
