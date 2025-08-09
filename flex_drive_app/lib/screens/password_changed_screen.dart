import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/utills/custom_colors.dart';
import 'package:flexdrive/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordChangedScreen extends StatelessWidget {
  static const routeName = 'PasswordChangedScreen';
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              width: 290.w,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 33.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 225.h,
                  ),
                  Center(
                    child: Image.asset(Image_assets.password_changed_vector),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    'Your password has Changed',
                    style: TextStyle(
                      color: AppColors.kTextColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Don\'t worry, we\'ll let you know if there\'s a\nproblem with your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF9F9F9F),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 140.h,
                  ),
                  GradientButton(
                      text: 'Back to Log in',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, loginRoute);
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
