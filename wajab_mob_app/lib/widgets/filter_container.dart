import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class FilterContainer extends GetView<Languagecontroller> {
  final String title;
  const FilterContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Create a reactive state to track selection
    RxBool isSelected = false.obs;

    return Obx(() => GestureDetector(
          onTap: () {
            // Toggle selection state
            isSelected.value = !isSelected.value;
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.5.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: isSelected.value
                  ? AppColors.kPrimaryColor // Green color when selected
                  : AppColors.kScaffoldColor, // Default color
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                  color: isSelected.value
                      ? AppColors.kPrimaryColor
                      : const Color(0xffE2E5E8)),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.3.sp,
                fontWeight: FontWeight.w500,
                fontFamily: controller.fontFamily.value,
                color: isSelected.value
                    ? AppColors.kScaffoldColor // White text when selected
                    : const Color(0xff868787), // Default text color
              ),
            ),
          ),
        ));
  }
}
