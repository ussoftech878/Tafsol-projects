import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';

Widget black14w500({required String data, bool? centre}) {
  return Text(
    textAlign: centre != null  && centre == true? TextAlign.center : TextAlign.left,
    data,
    style: TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 14.sp,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500),
  );
}