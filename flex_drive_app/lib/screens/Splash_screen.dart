import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/view_models/Splash_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<SplashProvider>().startSplashTimer(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0.w,
            left: 0,
            right: 180.w,
            child: Image.asset(
              alignment: Alignment.bottomLeft,
              Image_assets.splash_vector,
              width: 100.w,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 70.w),
              child: Image.asset(
                Image_assets.splash_logo,
              ),
            ),
          ),
        ],
      ),
    );
    /* Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 38.w,
            child: Image.asset(
              Image_assets.splash_vector,
              width: 100.w,
            ),
          ),
          Center(
            child: Image.asset(
              Image_assets.splash_logo,
              width: 62.w,
            ),
          ),
        ],
      ),
    );
   */
  }
}
