import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

import '../constants/colors_constants.dart';

class GenderContainer extends StatelessWidget {
  Languagecontroller languagecontroller = Get.put(Languagecontroller());

  final String text;
  final Widget icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;
  final String fontFamily;

  GenderContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.color,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 167.5,
        // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.7.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11.r),
            border: Border.all(
              color:
                  isSelected ? AppColors.forestColor : const Color(0xffE2E5E8),
              width: 1.5,
            ),
            color: AppColors.kScaffoldColor),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: 8.w),
              Text(text,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff868787),
                    fontFamily: languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
