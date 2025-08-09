import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';

class QuickPayScreen extends StatelessWidget {
  static const routeName = 'QuickPayScreen';
  const QuickPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 24.h),
        title: const Text('Quick Pay'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: SvgPicture.asset(
              svgAssets.scanbarcode,
              width: 24.w,
              height: 24.h,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 39.h),
          child: Column(
            children: [
              Center(
                  child: SvgPicture.asset(
                svgAssets.logo3,
                width: 191.w,
                height: 28.73,
              )),
              SizedBox(
                height: 25.h,
              ),
              SvgPicture.asset(
                svgAssets.scanner,
                width: 267.w,
                height: 239.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text('John Doe',
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
              k1hSizedBox,
              Text(
                textAlign: TextAlign.center,
                'Johndow12@wabisabi',
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Divider(
                color: Color(0xffD8D8D8),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'Quick Code',
                style:
                    TextStyle(fontSize: 15.3.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text('014 456',
                  style: TextStyle(
                      fontSize: 29.5.sp,
                      letterSpacing: 5,
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 17.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Expires in:',
                    style: TextStyle(
                      fontSize: 15.3.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircularPercentIndicator(
                    radius: 16.0.w,
                    lineWidth: 3.0.w,
                    percent: 0.7,
                    center: Text(
                      "10",
                      style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    progressColor: AppColors.kPrimaryColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
