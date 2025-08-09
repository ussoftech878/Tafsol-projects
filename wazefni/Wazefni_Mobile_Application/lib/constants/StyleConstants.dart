import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_constants.dart';

//style constants of the app
class StylesConstants {
  static final ButtonStyle elevated_b_redBack_whiteFore =
      ElevatedButton.styleFrom(
    textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    backgroundColor: AppColors.orangeColor,
    foregroundColor: Colors.white,
    elevation: 4,
  );
}
