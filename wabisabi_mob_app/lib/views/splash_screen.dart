import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  static const routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
            child: SvgPicture.asset(
          svgAssets.logo,
          width: 100.w,
          height: 100.h,
        )),
      ),
    );
  }
}
