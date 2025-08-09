import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/services/customPrint.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/KYC_on_boarding.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/sign_in_screen.dart';

class VerifyProfileScreen extends GetView<KycOnBoardingController> {
  /* final KycOnBoardingController controller =
      Get.put(KycOnBoardingController(), permanent: true); */
  static const routeName = 'VerifyProfileScreen';
  VerifyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Center(
              child: SvgPicture.asset(
                svgAssets.tick,
                width: 237.w,
                height: 237.h,
              ),
            ),
            SizedBox(
              height: 41.h,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Welcome to Wabi Sabi Pay!\n',
                    style: TextStyle(
                      fontSize: 21.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                    children: [
                      TextSpan(
                        text:
                            ' Get started with secure payments and smart contracts.',
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      )
                    ])),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.GetUserDetails().then((value) {
                        if (value) {
                          controller.setControllerValues();
                          // Get.offAllNamed(SignInScreen.routeName);
                          // Get.until((route)=> route.isFirst );
                          Get.toNamed(KycOnBoarding.routeName);

                          // Get.toNamed(KycOnBoarding.routeName);
                        }
                      });
                    },
                    child: const Text('Verify Profile'))),
          ],
        ),
      ),
    );
  }
}
