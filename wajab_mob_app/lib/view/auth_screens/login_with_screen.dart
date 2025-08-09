// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/constants/constants.dart';
import 'package:wajba_mobile_app/view/auth_screens/sign_up_screen.dart';

import '../bot_nav_bar/bot_nav_bar.dart';

class LoginWithScreen extends StatefulWidget {
  static const routeName = 'LoginWithScreen';

  const LoginWithScreen({super.key});

  @override
  State<LoginWithScreen> createState() => _LoginWithScreenState();
}

class _LoginWithScreenState extends State<LoginWithScreen> {
  Languagecontroller languagecontroller = Get.put(Languagecontroller());

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize video player controller
    _controller = VideoPlayerController.asset(VideoAssets.fruits)
      ..initialize().then((_) {
        // setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: VideoPlayer(_controller),
          ),
          Container(
            color: AppColors.kPrimaryColor.withOpacity(0.92),
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 27.w,
                right: 27.w,
                top: 80.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      svgAssets.wajba,
                      width: 182.99.w,
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      svgAssets.group,
                      width: 260.w,
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: Colors.black,
                        foregroundColor: AppColors.kTextColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          svgAssets.apple,
                          width: 16.w,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text('Continue with Apple'.tr,
                            style: TextStyle(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          svgAssets.google,
                          width: 17.w,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text('Continue with Google'.tr,
                            style: TextStyle(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BottomSheetManager.loginBottomSheet(context);
                      // Get.toNamed(HomeScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: const Color(0xFF104D4D),
                        foregroundColor: AppColors.kTextColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          svgAssets.email,
                          width: 19.w,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text('Continue with Email'.tr,
                            style: TextStyle(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(BotNavBar.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: const Color(0xFF104D4D),
                        foregroundColor: AppColors.kTextColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          svgAssets.person,
                          width: 19.w,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Continue as Guest'.tr,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? '.tr,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.kTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: languagecontroller.fontFamily.value,
                            ),
                      ),
                      k1wSizedBox,
                      InkWell(
                        onTap: () {
                          Get.toNamed(SignUpScreen.routeName);
                        },
                        child: Text(
                          'Sign Up'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: const Color(0xffBDFFE1),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: languagecontroller.fontFamily.value,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
