import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class VoucherTile extends GetView<Languagecontroller> {
  final bool showDivider;
  const VoucherTile({super.key, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              svgAssets.voucher,
              width: 34.w,
            ),
            SizedBox(
              width: 14.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BHD 0.5 off',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: controller.fontFamily.value,
                        color: const Color(0xff4F4F4F),
                        fontWeight: FontWeight.w500),
                  ),
                  Text('Valid till December 12, 2024'.tr,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xff868787),
                        fontWeight: FontWeight.w500,
                        fontFamily: controller.fontFamily.value,
                      )),
                ],
              ),
            ),
          ],
        ),
        if (showDivider)
          Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              const Divider(
                color: Color(0xffE2E5E8),
                thickness: 1.6,
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          )
      ],
    );
  }
}
