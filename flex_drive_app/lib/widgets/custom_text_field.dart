import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.suffix,
    this.prefix,
  });

  final String hint;
  final SvgPicture? suffix;
  final SvgPicture? prefix;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextFormField(
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefixIcon: prefix,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.5.h, horizontal: 22.h),
          hintText: hint,
        ),
      ),
    );
  }
}
