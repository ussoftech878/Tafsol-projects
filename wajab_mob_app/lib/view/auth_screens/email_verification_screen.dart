import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/constants/constants.dart';
import 'package:wajba_mobile_app/view/auth_screens/sign_up_form_screen.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

class EmailVerificationScreen extends StatelessWidget {
  static const routeName = 'EmailVerificationScreen';
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check your Email'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            // ignore: prefer_const_constructors
            icon:SvgPicture.asset(svgAssets.backArrow)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: LanguageButton()
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.5.w, vertical: 3.h),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(child: SvgPicture.asset(svgAssets.checkemail)),
            k3hSizedBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Hero(
                tag: 'email',
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          'To verify your email address, click the link in the email that we sent to ',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: const Color(0xff868787),
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: 'someone@some.com',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: AppColors.kPrimaryColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(SignUpFormScreen.routeName);
                  },
                  child: const Text('Open Email App')),
            ),
            k2hSizedBox,
            Text(
              textAlign: TextAlign.center,
              'Resend Verification',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xffC2C2C2), fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
