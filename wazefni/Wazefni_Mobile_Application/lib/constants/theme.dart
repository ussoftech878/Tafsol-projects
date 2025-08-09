import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'colors_constants.dart';
import 'constants.dart';

// this is a custom theme data class for both light and dark themes
class CustomTheme {
  var lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: AppColors.whiteColor,
      primaryColor: AppColors.orangeColor,
      primaryIconTheme: const IconThemeData(color: AppColors.orangeColor),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStateProperty.all(AppColors.orangeColor),
      )),
      colorScheme:
          ColorScheme.fromSeed(seedColor: AppColors.orangeColor).copyWith(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10),
        textStyle: TextStyle(
            color: AppColors.whiteColor2,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: AppColors.orangeColor,
        foregroundColor: AppColors.whiteColor2,
        elevation: 0,
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        textStyle: TextStyle(
            color: AppColors.orangeColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        side: const BorderSide(color: AppColors.orangeColor, width: 2),
      )),
      snackBarTheme: const SnackBarThemeData(),
      appBarTheme: AppBarTheme(
        actionsIconTheme: const IconThemeData(
          color: AppColors.whiteColor2,
        ),
        foregroundColor: Colors.black,
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.7,
            color: AppColors.whiteColor2

            // color: AppColors.kTextBlack
            ),
        /*iconTheme: IconThemeData(
          color: AppColors.BackButton,
          size: Device.screenType == ScreenType.tablet ? 17.sp : 18.sp,
        ),*/
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.orangeColor,
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
        backgroundColor: AppColors.orangeColor,
        secondaryLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          // color: AppColors.kTextWhite,
        ),
        checkmarkColor: AppColors.orangeColor,
        iconTheme: const IconThemeData(color: AppColors.orangeColor),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), // Rounded rectangle shape
          side: const BorderSide(width: 0),
        ),
      ),
      //-------------------------------------------CHECKBOX tHEME--------------------------
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        checkColor:
            const WidgetStatePropertyAll(AppColors.whiteColor2), // Check color

        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.orangeColor; // Background color when checked
          }
          return Colors.transparent;
        }),
        side: const BorderSide(
            color: Color(0xffE2E5E8), width: 3), // Border color
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(fontSize: 12.sp, color: Colors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        contentPadding: EdgeInsets.symmetric(vertical: 2.7.w, horizontal: 1.h),
        filled: true,

        fillColor: const Color(0xffF5F5F5),
        prefixIconColor: const Color(0xff141414),
        suffixIconColor: const Color(0xff949494),

        errorStyle: TextStyle(
            color: Colors.black, fontSize: 2.sp, fontWeight: FontWeight.w600),

        //label style for formField
        labelStyle: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xff7A7A7A),
            fontWeight: FontWeight.w400),
        hintStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff7A7A7A)),

        border: OutlineInputBorder(
            borderRadius: k10BorderRadius,
            borderSide: const BorderSide(color: Color(0xffADADAD), width: 1)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffADADAD), width: 1),
          borderRadius: k10BorderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffADADAD), width: 1),
          borderRadius: k10BorderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF5222D), width: 1),
          borderRadius: k10BorderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF5222D), width: 1),
          borderRadius: k10BorderRadius,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffADADAD), width: 1),
          borderRadius: k10BorderRadius,
        ),
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.orangeColor));
}
