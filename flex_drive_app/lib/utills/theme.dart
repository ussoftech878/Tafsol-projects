import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';

class CustomTheme {
  var lightTheme = ThemeData(fontFamily: 'Lato', useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,

    primaryColor: AppColors.kPrimaryColor,
    primaryIconTheme: const IconThemeData(color: AppColors.kIconColor),
    iconTheme: const IconThemeData(color: AppColors.kIconColor),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      iconColor: WidgetStateProperty.all(AppColors.kIconColor),
    )),

    colorScheme:
        ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor).copyWith(
            // secondary: kSecondaryColor,
            ),

    // tabBarTheme: const TabBarTheme(
    //     labelColor: AppColors.kPrimaryColor,
    //     indicatorColor: AppColors.kPrimaryColor,
    //     // dividerColor:
    //     unselectedLabelColor: AppColors.kPrimaryColor70)
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: TextStyle(color: AppColors.kPrimaryColor, fontSize: 14.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: AppColors.kPrimaryColor,
      foregroundColor: AppColors.kSecondaryColor,
      elevation: 4,
    )),
    snackBarTheme: const SnackBarThemeData(
        // backgroundColor: kSecondaryColor,
        // contentTextStyle: TextStyle(
        //     color: AppColors.kTextWhiteColor,
        //     fontSize: 10.sp,
        //     fontWeight: FontWeight.w700),
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
          color: AppColors.kTextBlack),
      iconTheme:const IconThemeData(
        color: Colors.black,
        //size: Device.screenType == ScreenType.tablet ? 17.sp : 18.sp,
      ),
      elevation: 0,
    ),

    //input decoration theme for all our the app
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.kbottomnavbarcolor,
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
      // selectedColor: AppColors.kPrimaryColor,
      // disabledColor: AppColors.kBlueLightShade,
      // labelStyle: const TextStyle(
      //   color: AppColors.seco,
      //   fontWeight: FontWeight.bold,
      // ),
      // secondarySelectedColor: AppColors.kBerkeleyBlue,
      secondaryLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.kTextWhite,
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
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      checkColor: const WidgetStatePropertyAll(Colors.blue), // Check color

      fillColor:
          const WidgetStatePropertyAll(Colors.transparent), // Background color
      side: const BorderSide(color: Colors.white, width: 2), // Border color
    ),

    inputDecorationTheme: const InputDecorationTheme().copyWith(
        contentPadding: EdgeInsets.symmetric(vertical: 21.w, horizontal: 22.w),
        filled: true,
        fillColor: AppColors.kTextfieldColor,
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        prefixStyle: TextStyle(fontSize: 10.sp),
        //label style for formField
        labelStyle: TextStyle(
            fontSize: 15.sp,
            // color: AppColors.kTextblackColor,
            fontWeight: FontWeight.normal),
        hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.kTextfieldBorderColor),

        // enabledBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         color: kTextLightColor, width: kWidthOfInputBoarder),
        //     borderRadius: kBorderRadiusAll),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            borderSide:
                BorderSide(color: AppColors.kTextfieldBorderColor, width: 1.w)
            //  BorderSide(
            //     width: 5, color: const Color.fromARGB(255, 255, 255, 255)),
            ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            borderSide:
                BorderSide(color: AppColors.kTextfieldBorderColor, width: 1.w)
            //  BorderSide(
            //     width: 5, color: const Color.fromARGB(255, 255, 255, 255)),
            )
        //     borderRadius: kBorderRadiusAll),
        // disabledBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         color: kTextLightColor, width: kWidthOfInputBoarder),
        //     borderRadius: kBorderRadiusAll),
        // on focus  change color
        // focusedBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         color: kSecondaryColor, width: kWidthOfInputBoarder),
        //     borderRadius: kBorderRadiusAll),
        //color changes when user enters wrong information,

        // errorBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         color: kErrorBorderColor, width: kWidthOfInputBoarder),
        //     borderRadius: kBorderRadiusAll),
        // //same on focus error color
        // focusedErrorBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //       color: kErrorBorderColor,
        //       width: kWidthOfInputBoarder,
        //     ),
        //     borderRadius: kBorderRadiusAll),
        ),
    // textTheme: TextTheme(
    //   //custom text for headline
    //   displaySmall: TextStyle(
    //     color: AppColors.kTextWhite,
    //     fontSize: 22.sp,
    //   ),
    //   labelLarge: TextStyle(
    //       // color: AppColors.kTextWhiteColor,
    //       fontSize: 20.sp,
    //       fontWeight: FontWeight.w800),
    //   headlineSmall: TextStyle(
    //     color: AppColors.kTextWhite,
    //     fontSize: 18.sp,
    //   ),
    //   headlineMedium: TextStyle(
    //     color: AppColors.kTextWhite,
    //     fontWeight: FontWeight.bold,
    //     fontSize: 16.sp,
    //   ),
    //   headlineLarge: TextStyle(
    //       color: AppColors.kTextWhite,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 17.sp
    //       //  SizerUtil.deviceType == DeviceType.tablet ? 22.sp : 35.sp,
    //       ),

    //   // body text style
    //   bodyLarge: TextStyle(
    //     color: AppColors.kTextWhite,
    //     fontSize: 16.sp,
    //   ),
    //   bodyMedium: TextStyle(
    //     color: AppColors.kTextWhite,
    //     fontSize: 15.sp,
    //   ),
    //   bodySmall: TextStyle(
    //       color: AppColors.kTextWhite,
    //       fontSize: 13.sp,
    //       fontWeight: FontWeight.normal),

    //   // title style
    //   titleMedium: TextStyle(
    //       color: AppColors.kTextWhite,
    //       fontSize: 20.sp,
    //       fontWeight: FontWeight.w700),
    //   titleSmall: TextStyle(
    //       color: AppColors.kTextWhite,
    //       fontSize: 13.sp,
    //       fontWeight: FontWeight.w500),
    // ),
  );
}
