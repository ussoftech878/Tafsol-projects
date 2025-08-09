import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

import 'colors_constants.dart';
import 'constants.dart';

class AppTheme {
  AppTheme._();

  static String getFontFamily() {
    try {
      return Get.find<Languagecontroller>().fontFamily.value;
    } catch (e) {
      return 'GeneralSans'; // Default font family
    }
  }

  static ThemeData get lightTheme {
    return ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.kScaffoldColor,
      primaryColor: AppColors.kPrimaryColor,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStateProperty.all(AppColors.kPrimaryColor),
      )),
      colorScheme:
          ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor).copyWith(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        elevation: 0,
        shadowColor: Colors.transparent,
        textStyle: TextStyle(
            color: AppColors.kTextColor,
            fontSize: 16.sp,
            fontFamily: getFontFamily(),
            fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(300)),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: AppColors.kTextColor,
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        textStyle: TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        side: const BorderSide(color: AppColors.kPrimaryColor, width: 2),
      )),
      snackBarTheme: const SnackBarThemeData(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.kScaffoldColor,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: getFontFamily(),
            letterSpacing: 0.5,
            color: const Color(0xff252525)),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.kPrimaryColor,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: TextStyle(
            fontSize: 13.sp,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 13.sp,
          )),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.kPrimaryColor,
        secondaryLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        checkmarkColor: AppColors.kPrimaryColor,
        iconTheme: const IconThemeData(color: AppColors.kPrimaryColor),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: const BorderSide(width: 0),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        checkColor: const WidgetStatePropertyAll(AppColors.kTextColor),
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.kPrimaryColor;
          }
          return Colors.transparent;
        }),
        side: const BorderSide(color: Color(0xffE2E5E8), width: 3),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
        filled: true,
        fillColor: AppColors.kScaffoldColor,
        labelStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.kTextGreyColor,
            fontFamily: getFontFamily(),
            fontWeight: FontWeight.w500),
        hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: getFontFamily(),
            color: const Color(0xff868787)),
        border: OutlineInputBorder(
            borderRadius: k15BorderRadius,
            borderSide:
                BorderSide(color: const Color(0xffE2E5E8), width: 10.r)),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFE2E5E8),
            ),
            borderRadius: BorderRadius.circular(11)),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF16055), width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF16055), width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE2E5E8), width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.kPrimaryColor),
    );
  }
}
