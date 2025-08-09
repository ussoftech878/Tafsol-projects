import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class DetailContainer extends GetView<Languagecontroller> {
  final Widget icon;
  final Widget text;
  const DetailContainer({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xffEBEBEB),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          SizedBox(
            width: 3.w,
          ),
          k1wSizedBox,
          text
        ],
      ),
    );
  }
}
