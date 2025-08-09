import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_constants.dart';

class StylesConstants {
  static final ButtonStyle elevated_b_redBack_whiteFore =
      ElevatedButton.styleFrom(
    textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    backgroundColor: AppColors.kPrimaryColor,
    foregroundColor: Colors.white,
    elevation: 4,
  );
  static final TextStyle hintTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24.sp,
      color: Colors.black,
      wordSpacing: 1.w);
  static final EdgeInsets hintContantPadding =
      EdgeInsets.symmetric(horizontal: 4.w);
}
