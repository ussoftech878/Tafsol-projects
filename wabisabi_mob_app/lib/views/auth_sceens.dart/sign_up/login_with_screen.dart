import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/sign_in_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/signup_onboarding.dart';

class LoginWithScreen extends StatelessWidget {
  static const routeName = 'LoginWithScreen';
  const LoginWithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          bottom: 24.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
                child: SvgPicture.asset(
              svgAssets.logo,
              width: 65.5.w,
              height: 50.5.h,
            )),

            SizedBox(
              height: 24.h,
            ),
            Text('Explore Now',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp)),
            SizedBox(height: 12.h),
            Text('Join Us Today',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 18.sp)),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Button(
                      onPressed: () {},
                      text: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              svgAssets.apple,
                              width: 24.w,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text('Apple',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff61677D),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp))
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Expanded(
                  child: Button(
                      onPressed: () {},
                      text: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              svgAssets.google,
                              width: 24.w,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text('Google',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff61677D),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp))
                          ],
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 38.h,
            ),
            // SvgPicture.asset(
            //   svgAssets.or,
            //   height: 25.h,
            // ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Divider(),
                ),
                Text("Or",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp)),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(SignUpOnBoarding.routeName);
                    },
                    child: const Text('Create Account'))),
            SizedBox(
              height: 24.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Already have an account?',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 15.sp)),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed(SignInScreen.routeName);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: AppColors.kPrimaryColor),
                    ))),
            const Spacer(),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'By signing up, you agree to the ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                        fontSize: 12.sp),
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: ' and',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).textTheme.bodySmall!.color,
                            fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: ' Privacy Policy',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: ', including ',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).textTheme.bodySmall!.color,
                            fontSize: 12.sp),
                      ),
                      TextSpan(
                        text: 'Cookie Policy',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            fontSize: 12.sp),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget text;
  const Button({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xffF5F9FE)),
        onPressed: onPressed,
        child: text);
  }
}
