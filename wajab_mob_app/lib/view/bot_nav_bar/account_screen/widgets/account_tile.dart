import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class AccountTile extends GetView<Languagecontroller> {
  final Widget svg;
  final String title;
  final bool showDivider;

  const AccountTile(
      {this.showDivider = true,
      super.key,
      required this.svg,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              svg,
              SizedBox(
                width: 14.w,
              ),
              Text(title,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff4F4F4F),
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w500)),
              const Spacer(),
              SvgPicture.asset(
                svgAssets.noti_arrow,
                width: 6.w,
                height: 12.h,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          if (showDivider)
            const Divider(
              color: Color(0xffE2E5E8),
              thickness: 1.6,
            )
        ],
      ),
    );
  }
}
