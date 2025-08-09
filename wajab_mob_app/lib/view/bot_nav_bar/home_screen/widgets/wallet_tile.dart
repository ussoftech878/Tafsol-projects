import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class WalletTile extends GetView<Languagecontroller> {
  final String title;
  final String amount;
  final Widget svgAsset;
  final bool? bottomPadding;
  final TextStyle textStyle;
  const WalletTile(
    this.title,
    this.amount,
    this.svgAsset,
    this.textStyle, {
  this.bottomPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.2.h),
      child: Column(
        children: [
          Row(
            children: [
              // SvgPicture.asset(svgAssets.receive),
              svgAsset,
              SizedBox(
                width: 14.w,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color(0xff4F4F4F),
                    fontFamily: controller.fontFamily.value,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                amount,
                style: textStyle,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(
            color: Color(0xffE2E5E8),
          ),
          bottomPadding == null ?
         SizedBox(
              height: 10.h,
            )
          :SizedBox(
            height: 0.h,
          ),
        ],
      ),
    );
  }
}
