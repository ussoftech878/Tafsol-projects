import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBoxButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  const DialogBoxButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 106.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )),
          ),
        ),
      ),
    );
  }
}
