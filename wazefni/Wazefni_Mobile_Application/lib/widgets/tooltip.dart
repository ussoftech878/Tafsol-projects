import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';

class CustomTooltip extends StatelessWidget {
  final String message;

  const CustomTooltip({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    Languagecontroller languagecontroller = Get.put(Languagecontroller());
    return SuperTooltip(
      //showBarrier: false,
      arrowLength: 13,
      hasShadow: false,
      popupDirection: TooltipDirection.up,
      backgroundColor: AppColors.orangeColor,
      borderRadius: 5,
      borderColor: AppColors.orangeColor,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.whiteColor2,
              fontSize: 15.sp,
              fontFamily: languagecontroller.fontFamily.value,
            ),
      ),
      child: SvgPicture.asset(
        svgAssets.Icon_Placeholder,
        width: 2.w,
        height: 2.h,
        fit: BoxFit.scaleDown,
      ),
    );
    /* Tooltip(
        preferBelow: false,
        message: message,
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.kTextWhiteColor,
              fontSize: 15.sp,
            ),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: SvgPicture.asset(
          svgAssets.Icon_Placeholder,
          width: 2.w,
          height: 2.h,
          fit: BoxFit.scaleDown,
        )); */
  }
}
