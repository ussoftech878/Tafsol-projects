// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'colors_constants.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      // fontFamily: 'Poppins',
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.kPrimaryColor,
      ),
      scaffoldBackgroundColor: AppColors.kScaffoldColor,
      primaryColor: AppColors.kPrimaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
      iconTheme: const IconThemeData(color: AppColors.kIconColor),
      // iconButtonTheme: const IconButtonThemeData(style: ButtonStyle()),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        textStyle: TextStyle(
            // color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: AppColors.kWhiteColor,
        elevation: 0,
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.kPrimaryColor,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        textStyle: TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 16.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        side: const BorderSide(color: AppColors.kPrimaryColor, width: 1),
      )),
      snackBarTheme: const SnackBarThemeData(),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Transparent status bar
          statusBarIconBrightness: Brightness.dark, // Dark icons (black)
          statusBarBrightness:
              Brightness.light, // Light status bar for iOS (dark icons)
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.7,
          color: AppColors.kBlackText,
        ),
        iconTheme: IconThemeData(
          color: AppColors.kIconColor,
        ),
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          // backgroundColor: AppColors.kbottomnavbarcolor,
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
          borderRadius: BorderRadius.circular(5.0), // Rounded rectangle shape
          side: const BorderSide(width: 0),
        ),
        // brightness: Brightness,
      ),
      //-------------------------------------------CHECKBOX tHEME--------------------------
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        checkColor:
            const WidgetStatePropertyAll(AppColors.kBlackText), // Check color

        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.kPrimaryColor;
          }
          return Colors.transparent;
        }),
        side: const BorderSide(
            color: Color(0xffE2E5E8), width: 3), // Border color
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
        filled: true,
        fillColor: const Color(0XFFF5F9FE),
        suffixIconColor: const Color(0xffB3B3B3),
        labelStyle: TextStyle(
          fontSize: 15.sp,
          color: const Color(0xffCBC3C3),
        ),
        errorStyle: TextStyle(
          fontSize: 12.sp,
          color: Colors.red,
        ),
        helperStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(fontSize: 16.sp, color: const Color(0xffB3B3B3)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: Color(0xffB3B3B3), width: 10)),
        focusedBorder: GradientOutlineInputBorder(
            gradient: LinearGradient(
                colors: const [Color(0xffFF7F50), Color(0xffFFDB58)]),
            borderRadius: BorderRadius.circular(15.r),
            width: 1),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffB3B3B3), width: 1),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffFD2727), width: 1),
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffFD2727), width: 1),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.kDividerColor,
        indent: 4.w,
        endIndent: 4.w,
        thickness: 2,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.kPrimaryColor));

  static ThemeData darkTheme = ThemeData(
    // fontFamily: 'Poppins',
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.kPrimaryColor,
    ),
    scaffoldBackgroundColor: AppColors.kScaffoldDarkColor,
    primaryColor: AppColors.kPrimaryColor,

    iconTheme: const IconThemeData(color: AppColors.kWhiteColor),
    // iconButtonTheme: const IconButtonThemeData(style: ButtonStyle()),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      textStyle: TextStyle(
          // color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      backgroundColor: AppColors.kPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.kPrimaryColor,
      padding: EdgeInsets.symmetric(vertical: 18.h),
      textStyle: TextStyle(
          color: AppColors.kPrimaryColor,
          fontSize: 16.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      side: const BorderSide(color: AppColors.kPrimaryColor, width: 1),
    )),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.7,
        color: AppColors.kWhiteColor,
      ),
      iconTheme: IconThemeData(
        color: AppColors.kWhiteColor,
      ),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        // backgroundColor: AppColors.kbottomnavbarcolor,
        selectedItemColor: AppColors.kPrimaryColor,
        unselectedItemColor: AppColors.kWhiteColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(
          fontSize: 13.sp,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 13.sp,
        )),

    // dropdownMenuTheme: DropdownMenuThemeData(
    //   menuStyle: MenuStyle(
    //     backgroundColor:
    //         MaterialStatePropertyAll<Color>(AppColors.kDarkFieldFillColor),
    //   ),
    //   // inputDecorationTheme:
    //   //     InputDecorationTheme(fillColor: AppColors.kDarkFieldFillColor),
    //   // menuStyle: MenuStyle(backgroundColor: AppColors.kDarkFieldFillColor),
    // ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.kPrimaryColor,
      secondaryLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      checkmarkColor: AppColors.kPrimaryColor,
      iconTheme: const IconThemeData(color: AppColors.kPrimaryColor),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // Rounded rectangle shape
        side: const BorderSide(width: 0),
      ),
      // brightness: Brightness,
    ),
    //-------------------------------------------CHECKBOX tHEME--------------------------
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      checkColor:
          const WidgetStatePropertyAll(AppColors.kBlackText), // Check color

      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.kPrimaryColor; // Background color when checked
        }
        return Colors.transparent;
      }),
      side:
          const BorderSide(color: Color(0xffE2E5E8), width: 3), // Border color
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
      filled: true,
      fillColor: AppColors.kDarkFieldFillColor,
      suffixIconColor: AppColors.kWhiteColor,
      iconColor: AppColors.kWhiteColor,
      prefixIconColor: AppColors.kWhiteColor,
      labelStyle: TextStyle(
        fontSize: 15.sp,
        color: AppColors.kWhiteColor,
      ),
      errorStyle: TextStyle(
        fontSize: 12.sp,
        color: Colors.red,
      ),
      helperStyle: TextStyle(color: AppColors.kWhiteColor),
      hintStyle: TextStyle(fontSize: 16.sp, color: AppColors.kWhiteColor),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide:
              const BorderSide(color: AppColors.kPrimaryColor, width: 10)),
      focusedBorder: GradientOutlineInputBorder(
          gradient: AppColors.kGraidentColor,
          borderRadius: BorderRadius.circular(15.r),
          width: 1),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffB3B3B3), width: 1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffFD2727), width: 1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffFD2727), width: 1),
        borderRadius: BorderRadius.circular(15.r),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.kFieldDivideDarkrColor,
      indent: 4.w,
      endIndent: 4.w,
      thickness: 2,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.kDarkBottomSheetColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
    ),

    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.kPrimaryColor),

    textTheme: TextTheme(
      displayLarge: const TextStyle(color: Colors.white),
      displaySmall: const TextStyle(color: Colors.white),
      // ···
      titleLarge: const TextStyle(color: Colors.white),
      titleMedium: const TextStyle(color: Colors.white),
      titleSmall: const TextStyle(color: Colors.white),
      bodyLarge: const TextStyle(color: Colors.white),
      bodyMedium: const TextStyle(color: Colors.white),
      bodySmall: const TextStyle(color: Colors.white),
    ),
  );
}

// final ThemeData lightTheme =

// //TODO: Define Dark theme
// final ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.grey[900],
// );
