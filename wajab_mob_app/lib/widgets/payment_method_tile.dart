import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/payment_methods/card_Selection_screen.dart';

class PaymentMethodTile extends GetView<Languagecontroller> {
  final Widget svg;
  final String title;
  final bool showDivider;

  const PaymentMethodTile(
      {this.showDivider = true,
      super.key,
      required this.svg,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(CardSelectionScreen.routeName);
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10).h,
                child: Row(
                  children: [
                    svg,
                    SizedBox(
                      width: 14.w,
                    ),
                    Text(title,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: const Color(0xff252525),
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w500)),
                    const Spacer(),
                    SvgPicture.asset(
                      svgAssets.noti_arrow,
                      height: 12.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            color: Color(0xffE2E5E8),
            thickness: 1.2,
          )
      ],
    );
  }
}
