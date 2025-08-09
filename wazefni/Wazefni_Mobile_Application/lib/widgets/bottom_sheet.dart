import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/controllers/NewPassController%20copy.dart';
import 'package:wazefni_iraq/view/auth_screens/sign_in/forget_pass_otp.dart';
import 'package:wazefni_iraq/widgets/custom_textfield.dart';
import 'package:wazefni_iraq/widgets/otp_field.dart';
import 'package:wazefni_iraq/widgets/tooltip.dart';
import '../constants/colors_constants.dart';
import '../view/auth_screens/sign_in/forget_pass_phone_otp.dart';

class BottomSheetManager {
  static Languagecontroller lang_controller = Get.put(Languagecontroller());
  static final BottomSheetController controller = BottomSheetController();
  static final _forgotPassformKey = GlobalKey<FormState>();
  static final _PhoneformKey = GlobalKey<FormState>();
  static final _phoneforgetPassformKey = GlobalKey<FormState>();

  static void _CustomBottomSheet(BuildContext context, List<Widget> children) {
    controller.emailController.clear();
    controller.phoneController.clear();
    controller.isEnabled.value = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.whiteColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.78, // 75% of screen height
          minChildSize: 0.4, // Minimum height is 40% of the screen height
          maxChildSize: 1.0, // Maximum height can be 100% of the screen height
          expand: false,

          builder: (context, controller) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(137.w, 6.h, 137.w, 14.5.h),
                        child: SvgPicture.asset(
                          svgAssets.Grabber,
                          width: 36.h,
                          height: 5.h,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: SvgPicture.asset(
                            svgAssets.wrong,
                            height: 24.h,
                            width: 24.h,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      ...children,
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void forgetPassBottomSheet(BuildContext context) {
    _CustomBottomSheet(context, [
      SvgPicture.asset(svgAssets.msg),
      Text(
        'Account Recovery'.tr,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: lang_controller.fontFamily.value,
            fontSize: 16.sp),
      ),
      SizedBox(
        height: 4.h,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Text(
            maxLines: 1,
            textAlign: TextAlign.center,
            'Enter your email to receive a password reset code.'.tr,
            style: TextStyle(
                fontFamily: lang_controller.fontFamily.value, fontSize: 12.sp)),
      ),
      SizedBox(
        height: 16.h,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Form(
          key: _forgotPassformKey,
          child: CustomTextFormField(
            // style: TextStyle(fontSize: 12.sp),
            keyboardType: TextInputType.emailAddress,
            controller: controller.emailController,
            onchange: () {
              if (_forgotPassformKey.currentState!.validate()) {
                controller.isEnabled.value = true;
              } else {
                controller.isEnabled.value = false;
              } //controller.isEnabled.value = true;
            },
            validator: (value) {
              if (GetUtils.isNullOrBlank(value)! ||
                  !GetUtils.isEmail(value.toString())) {
                return 'Invalid email address (example: example@email.com)'.tr;
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Mail".tr,
                border: const OutlineInputBorder(),
                prefixIcon: SvgPicture.asset(
                  svgAssets.mail_01,
                  fit: BoxFit.scaleDown,
                ),
                suffixIcon: CustomTooltip(
                  message: "Example: example@email.com".tr,
                )),
          ),
        ),
      ),
      SizedBox(
        height: 24.h,
      ),
      RichText(
          text: TextSpan(
              text: 'Recover via '.tr,
              style: TextStyle(
                  fontFamily: lang_controller.fontFamily.value,
                  color: AppColors.greyColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
              children: [
            TextSpan(
              text: 'Phone Number'.tr,
              style: TextStyle(
                  fontFamily: lang_controller.fontFamily.value,
                  color: AppColors.orangeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp),
            )
          ])),
      SizedBox(
        height: 24.h,
      ),
      Obx(() => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_forgotPassformKey.currentState!.validate()) {
                    Get.toNamed(ForgetPassOtp.routeName);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      controller.isEnabled.value ? null : Color(0xffFFD8BF),
                ),
                child: Text('Next'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: lang_controller.fontFamily.value,
                    )),
              ),
            ),
          ))
    ]);
  }

  static void PhoneConfirmation(BuildContext context, String routeTogo) {
    _CustomBottomSheet(context, [
      Padding(
        padding: EdgeInsets.fromLTRB(
            //top: 1.h, // Reduced the top padding
            16.w,
            0.w,
            16.w,
            83.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter Confirmation code'.tr,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                fontFamily: lang_controller.fontFamily.value,
              ),
            ),
            SizedBox(height: 12.w),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'The confirmation code sent via Whatsapp to'.tr,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: lang_controller.fontFamily.value,
                  ),
                  children: [
                    TextSpan(
                        text: '\n+964 123456789'.tr,
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: lang_controller.fontFamily.value,
                        ))
                  ]),
            ),
            SizedBox(
              height: 48.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                length: 4, // Number of OTP fields
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffADADAD)),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffADADAD)),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffADADAD)),
                  ),
                ),
                showCursor: false,
              ),
            ),
            SizedBox(height: 16.w),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Didn't receive the code?".tr,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: lang_controller.fontFamily.value,
                  ),
                  children: [
                    TextSpan(
                        text: 'Resend'.tr,
                        style: TextStyle(
                          color: AppColors.orangeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: lang_controller.fontFamily.value,
                        )),
                  ]),
            ),
            SizedBox(height: 16.w),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(routeTogo);
                    },
                    child: Text(
                      'Continue'.tr,
                      style: TextStyle(
                        fontFamily: lang_controller.fontFamily.value,
                      ),
                    )))
          ],
        ),
      )
    ]);
  }

  static void phoneforgetPassBottomSheet(BuildContext context) {
    _CustomBottomSheet(context, [
      SvgPicture.asset(svgAssets.phone),
      k1hSizedBox,
      Text(
        'Account Recovery'.tr,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: lang_controller.fontFamily.value,
            fontSize: 16.sp),
      ),
      SizedBox(
        height: 4.h,
      ),
      Text(
        textAlign: TextAlign.center,
        'Enter your phone to receive a password reset code.'.tr,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: lang_controller.fontFamily.value,
        ),
      ),
      SizedBox(
        height: 16.h,
      ),
      Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Container(
            height: 43.w,
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              border: Border.all(
                color: Color(0xffADADAD),
              ),
              borderRadius: k10BorderRadius,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(svgAssets.iraq),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(' +964',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: lang_controller.fontFamily.value,
                        )),
                  ],
                ),
              ),
            ),
          ) */
          Expanded(
              flex: 1,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "+964",
                    prefixIconConstraints:
                        BoxConstraints.tight(Size(40.w, 40.w)),
                    hintStyle: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                    prefixIcon: SvgPicture.asset(
                      svgAssets.iraq,
                      width: 20,
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  enabled: false,
                ),
              )),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            flex: 3,
            child: Form(
              key: _PhoneformKey,
              child: CustomTextFormField(
                keyboardType: TextInputType.phone,
                controller: controller.phoneController,
                onchange: () {
                  if (_PhoneformKey.currentState!.validate()) {
                    controller.isEnabled.value = true;
                  } else {
                    controller.isEnabled.value = false;
                  } //controller.isEnabled.value = true;
                },
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Invalid phone number (example: xxx-xxx-xxx)'.tr;
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Phone Number".tr,
                    prefixIcon: SvgPicture.asset(
                      svgAssets.smart_phone_01,
                      width: 20,
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                    suffixIcon: CustomTooltip(
                      message: "Example: 123-456-7890".tr,
                    )),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 24.h,
      ),
      RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Recover via '.tr,
              style: TextStyle(
                  fontFamily: lang_controller.fontFamily.value,
                  color: AppColors.greyColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                  text: 'Email'.tr,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColors.orangeColor,
                        fontSize: 12.sp,
                        fontFamily: lang_controller.fontFamily.value,
                        fontWeight: FontWeight.w600,
                      ),
                )
              ])),
      SizedBox(
        height: 24.h,
      ),
      Obx(() => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_PhoneformKey.currentState!.validate()) {
                    Get.toNamed(ForgetPassPhoneOtp.routeName);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      controller.isEnabled.value ? null : Color(0xffFFD8BF),
                ),
                child: Text('Next'.tr,
                    style: TextStyle(
                      fontFamily: lang_controller.fontFamily.value,
                    )),
              ),
            ),
          ))
    ]);
  }

//   static void continueWithEmailBottomSheet(BuildContext context) {
//     bool isPasswordVisible = false; // Declare it outside the StatefulBuilder.

//     _CustomBottomSheet(context, [
//       Text(
//         'Welcome Back!',
//         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//             color: const Color(0xff252525), fontWeight: FontWeight.bold),
//       ),
//       Text(
//         'Sign into your account',
//         style: Theme.of(context)
//             .textTheme
//             .labelLarge!
//             .copyWith(color: AppColors.kTextGreyColor),
//       ),
//       k3hSizedBox,
//       Text(
//         'Email',
//         style: Theme.of(context)
//             .textTheme
//             .labelLarge!
//             .copyWith(color: AppColors.kTextGreyColor),
//       ),
//       k1hSizedBox,
//       const TextField(
//         decoration: InputDecoration(
//           hintText: 'someone@gmail.com',
//           prefixIcon: Icon(Icons.email_outlined),
//         ),
//       ),
//       k2hSizedBox,
//       Text(
//         'Password',
//         style: Theme.of(context)
//             .textTheme
//             .labelLarge!
//             .copyWith(color: AppColors.kTextGreyColor),
//       ),
//       k1hSizedBox,
//       StatefulBuilder(
//         builder: (context, setState) {
//           return TextField(
//             obscureText: !isPasswordVisible,
//             decoration: InputDecoration(
//               // hintText: '**********',
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: SvgPicture.asset(
//                   svgAssets.lock,
//                   fit: BoxFit.scaleDown,
//                 ),
//               ),
//               suffixIcon: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isPasswordVisible =
//                           !isPasswordVisible; // Toggle visibility.
//                     });
//                   },
//                   icon: isPasswordVisible
//                       ? const Icon(
//                           Icons.visibility_outlined,
//                           color: Colors.black,
//                         )
//                       // : SvgPicture.asset(svgAssets.eyeSlash)),
//             ),
//           ));
//         },
//       ),
//       k1hSizedBox,
//       Align(
//         alignment: Alignment.centerRight,
//         child: InkWell(
//           onTap: () {
//             // Get.toNamed(ResetPassword.routeName);
//           },
//           child: Text(
//             'Forgot Password?',
//             style: Theme.of(context)
//                 .textTheme
//                 .labelLarge!
//                 .copyWith(color: AppColors.kPrimaryColor),
//           ),
//         ),
//       ),
//       k2hSizedBox,
//       SizedBox(

//         width: double.infinity,
//         child: ElevatedButton(onPressed: () {}, child: const Text('Login')),
//       ),
//       SizedBox(

//         height: 15.h,
//       ),
//     ]);
//   }
// }
}
