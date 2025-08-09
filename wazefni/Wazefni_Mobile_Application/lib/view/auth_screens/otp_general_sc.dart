import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/controllers/Otp_general_controller.dart';
import 'package:wazefni_iraq/widgets/custom_app_bar.dart';

import '../../controllers/LanguageController.dart';

class Otp_General_Sc extends StatefulWidget {
  static const routeName = 'Otp_General_Sc';
  final String routeToGo;
  final String Title;
  final String SubTitle;
  final String subtext;
  final String editText;

  const Otp_General_Sc(
      {super.key,
      required this.routeToGo,
      required this.Title,
      required this.SubTitle,
      required this.subtext,
      required this.editText});

  @override
  State<Otp_General_Sc> createState() => _Otp_General_ScState();
}

class _Otp_General_ScState extends State<Otp_General_Sc> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final OtpGeneralController controller = Get.put(OtpGeneralController());
    return Scaffold(
      appBar: MyAppBar(title: "", onPressed: () => Get.back()),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.Title.tr,
              style: TextStyle(
                color: AppColors.blackColor,
                fontFamily: controller.lang_controller.fontFamily.value,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            Text(
              widget.SubTitle.tr,
              style: TextStyle(
                color: AppColors.greyColor,
                fontFamily: controller.lang_controller.fontFamily.value,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
            Text(widget.subtext,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: controller.lang_controller.fontFamily.value,
                    fontSize: 12.sp)),
            SizedBox(
              height: 36.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(svgAssets.Icon_Leading),
                k2wSizedBox,
                Text(widget.editText.tr,
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 12.sp,
                      fontFamily: controller.lang_controller.fontFamily.value,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
            SizedBox(
              height: 24.w,
            ),
            Form(
              key: _formKey,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Obx(() {
                    // Get OTP value from controller (using Rx<String>)
                    String otpValue = controller.otpController.value;
                    Color borderColor;
                    Color fillColor;

                    // Update colors based on OTP length
                    if (otpValue.isNotEmpty && otpValue.length < 4) {
                      borderColor = Colors.red;
                      fillColor = const Color(0xffFEE5E5); // Light red
                    } else if (otpValue.length == 4) {
                      borderColor = Colors.green;
                      fillColor = const Color(0xffE8F8E8); // Light green
                    } else {
                      borderColor = const Color(0xffADADAD); // Default grey
                      fillColor = const Color(0xffF5F5F5); // Default light grey
                    }

                    return Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        // controller: controller.otpController,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        length: 4, // Number of OTP fields
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the code'.tr;
                          } else if (value.length < 4) {
                            return 'Code must be 4 digits'.tr;
                          }
                          return null;
                        },
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                          decoration: BoxDecoration(
                            color: fillColor,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: borderColor),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                          decoration: BoxDecoration(
                            color: fillColor,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: borderColor),
                          ),
                        ),
                        submittedPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                          decoration: BoxDecoration(
                            color: fillColor,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: borderColor),
                          ),
                        ),
                        showCursor: false,
                        onChanged: (value) {
                          // Update the OTP value dynamically
                          controller.otpController.value = value;

                          // Validate the form and update the isEnabled status
                          if (_formKey.currentState!.validate()) {
                            controller.isEnabled.value = true;
                          } else {
                            controller.isEnabled.value = false;
                          }
                        },
                      ),
                    );
                  })),
            ),
            SizedBox(
              height: 24.w,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: /* _timerCompleted
                  ? TextSpan(
                      text: "Didn't receive the code?".tr,
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: controller.lang_controller.fontFamily.value,
                      ),
                      children: [
                        TextSpan(
                          text: 'Resend'.tr,
                          style: TextStyle(
                            color: AppColors.orangeColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily:
                                controller.lang_controller.fontFamily.value,
                          ),
                        )
                      ],
                    )
                  : */
                  TextSpan(
                      text: 'You will receive the code within '.tr,
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                        fontFamily: controller.lang_controller.fontFamily.value,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                    TextSpan(
                        text:
                            "00:18" /* ' 00:${_start.toString().padLeft(2, '0')}' */,
                        style: TextStyle(
                          color: AppColors.orangeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        )),
                    TextSpan(
                      text: 'seconds'.tr,
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontFamily: controller.lang_controller.fontFamily.value,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 82.w,
            ),
            Obx(() => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.isEnabled.value
                          ? Get.toNamed(widget.routeToGo)
                          : null;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          controller.isEnabled.value ? null : Color(0xffFFD8BF),
                    ),
                    child: Text(
                      'Continue'.tr,
                      style: TextStyle(
                          fontFamily:
                              controller.lang_controller.fontFamily.value),
                    ))))
          ],
        ),
      ),
    );
  }
}
