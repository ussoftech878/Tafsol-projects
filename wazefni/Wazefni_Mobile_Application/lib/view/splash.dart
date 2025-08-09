import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/view/on_boarding_screens/onboarding_screen.dart';

class Splash extends StatefulWidget {
  static const routeName = 'Splash';

  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(OnboardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffFF7A45),
                  Color(0xffFA541C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Centered images
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/png/Layer_1.png',
                  width: 270.w,
                ),
                k1hSizedBox, // Adjust spacing as needed
                Image.asset(
                  'assets/png/Frame 1261161595.png',
                  width: 130.h,
                ),
              ],
            ),
          ),
          // Bottom image
          Positioned(
            bottom: 20, // Adjust distance from bottom as needed
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/png/جميع الحقوق محفوظة © 2025.png',
              width: 19.h,
            ),
          ),
        ],
      ),
    );
  }
}
