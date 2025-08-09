// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashController controller = Get.put(SplashController());
  static const routeName = 'SplashScreen';
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Image.asset(
          imageAssets.logoIcon,
          width: 84.62.w,
        ),
      ),
    );
  }
}
