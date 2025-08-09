import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';

class CategoryList extends GetView<HomeScreenController> {
  final String svgAsset;
  final String title;
  const CategoryList({super.key, required this.svgAsset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w),
      child: Column(
        children: [
          SvgPicture.asset(svgAsset, width: 64.24.w),
          SizedBox(height: 7.h),
          Text(title,
              style: TextStyle(
                color: const Color(0xff01615F),
                fontSize: 13.sp,
                fontFamily: controller.languagecontroller.fontFamily.value,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
