import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';

class CustomButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    Languagecontroller langController = Get.put(Languagecontroller());
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffEBEBEB),
          minimumSize: Size(343.w, 40.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 8.w,
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: langController.fontFamily.value,
                color: AppColors.greyColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
