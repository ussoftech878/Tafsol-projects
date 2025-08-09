import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/controllers/CorporateSignupScreen_controller%20.dart';
import 'package:wazefni_iraq/controllers/InstitutionSignupScreen_controller%20.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/view/auth_screens/Institutions_email_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/corporate_email_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/otp_general_sc.dart';
import 'package:wazefni_iraq/view/auth_screens/otp_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/signin_screen.dart';
import 'package:wazefni_iraq/widgets/CustomAppBarEployer.dart';
import 'package:wazefni_iraq/widgets/custom_textfield.dart';
import 'package:wazefni_iraq/widgets/tooltip.dart';

class InstitutionSignupScreen extends StatefulWidget {
  static const routeName = 'InstitutionSignupScreen';

  const InstitutionSignupScreen({super.key});

  @override
  State<InstitutionSignupScreen> createState() =>
      _InstitutionSignupScreenState();
}

class _InstitutionSignupScreenState extends State<InstitutionSignupScreen> {
  InstitutionsignupscreenController controller =
      Get.put(InstitutionsignupscreenController());
  final _formKey = GlobalKey<FormState>();

  final Languagecontroller lang_controller = Get.put(Languagecontroller());

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, navigate to the OTP screen
      Get.to(() => const OtpScreen(routeToGo: 'some_route'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarExample(
          title: "InstitutionSignupBar",
          onPressed: () {
            Get.back();
          },
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.w,
                ),
                Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          controller: controller.nameController,
                          onchange: () {
                            if (_formKey.currentState!.validate()) {
                              controller.isEnabled.value = true;
                            } else {
                              controller.isEnabled.value = false;
                            } //controller.isEnabled.value = true;
                          },
                          validator: (value) {
                            if (GetUtils.isNullOrBlank(value)!) {
                              return 'This field requires at least the binary name'
                                  .tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "InstitutionNameField".tr,
                            border: const OutlineInputBorder(),
                            prefixIcon: SvgPicture.asset(
                              width: 20,
                              height: 20,
                              svgAssets.building_06,
                              fit: BoxFit.scaleDown,
                            ),
                            suffixIcon: CustomTooltip(
                                message: "At least a binary name".tr),
                          ),
                        ),
                        SizedBox(
                          height: 16.w,
                        ),
                        CustomTextFormField(
                          controller: controller.emailController,
                          onchange: () {
                            if (_formKey.currentState!.validate()) {
                              controller.isEnabled.value = true;
                            } else {
                              controller.isEnabled.value = false;
                            } //controller.isEnabled.value = true;
                          },
                          validator: (value) {
                            if (GetUtils.isNullOrBlank(value)!) {
                              return 'Invalid email address (example: example@email.com)'
                                  .tr;
                              //+"(مثال: example@email.com)".tr;
                            } else if (!GetUtils.isEmail(value.toString())) {
                              return 'Invalid email address (example: example@email.com)'
                                  .tr;
                              //+"(مثال: example@email.com)".tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Mail".tr,
                            border: const OutlineInputBorder(),
                            prefixIcon: SvgPicture.asset(
                              svgAssets.mail_01,
                              width: 20,
                              height: 20,
                              fit: BoxFit.scaleDown,
                            ),
                            suffixIcon: CustomTooltip(
                              message: "Example: example@email.com".tr,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.w,
                        ),
                        Obx(
                          () => CustomTextFormField(
                            isPassword: true,
                            controller: controller.PasswordController,
                            onchange: () {
                              if (_formKey.currentState!.validate()) {
                                controller.isEnabled.value = true;
                              } else {
                                controller.isEnabled.value = false;
                              } //controller.isEnabled.value = true;
                            },
                            validator: (value) {
                              if (GetUtils.isNullOrBlank(value)!) {
                                return 'Please enter your password'.tr;
                              } else if (value!.length < 6) {
                                return 'The password must be at least 6 numbers or letters'
                                    .tr;
                              }
                              return null;
                            },
                            obscureText: !controller.isPasswordVisible.value,
                            decoration: InputDecoration(
                              hintText: "Password".tr,
                              border: const OutlineInputBorder(),
                              prefixIcon: SvgPicture.asset(
                                svgAssets.square_lock2,
                                width: 20,
                                height: 20,
                                fit: BoxFit.scaleDown,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isPasswordVisible.value =
                                      !controller.isPasswordVisible.value;
                                },
                                icon: controller.isPasswordVisible.value
                                    ? Icon(
                                        Icons.visibility_outlined,
                                        color: Color(0xff949494),
                                        size: 20.w,
                                      )
                                    : SvgPicture.asset(
                                        svgAssets.eye_hide,
                                        fit: BoxFit.scaleDown,
                                        width: 20.w,
                                      ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.w,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: Obx(() => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  // controller.isEnabled.value ? null : const Color(0xffFFD8BF),
                                  controller.isEnabled.value
                                      ? null
                                      : Color(0xffFFD8BF),
                            ),
                            onPressed: () {
                              controller.isEnabled.value
                                  ? {
                                      if (_formKey.currentState!.validate())
                                        {
                                          Get.toNamed(
                                            Otp_General_Sc.routeName,
                                            arguments: {
                                              'routeToGo':
                                                  InstitutionsEmailInfoScreen
                                                      .routeName,
                                              'Title': 'Email Confirmation',
                                              'SubTitle':
                                                  'Enter the confirmation code sent via email to ',
                                              'subtext': "example@email.com",
                                              'editText': "Edit Email"
                                            },
                                          )
                                        }
                                    }
                                  : null;
                            },
                            child: Text('Register'.tr,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                        lang_controller.fontFamily.value))))),
                    SizedBox(
                      height: 16.w,
                    ),
                    SizedBox(
                      width: 343.w,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "By registering you agree to our ".tr,
                            style: TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 12.sp,
                                fontFamily: lang_controller.fontFamily.value,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                text: "Terms of Use".tr,
                                style: TextStyle(
                                    color: AppColors.orangeColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily:
                                        lang_controller.fontFamily.value,
                                    fontSize: 12.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle "Terms of Use" tap
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Terms of Use".tr),
                                        content: Text(
                                            "This is where your Terms of Use content goes."
                                                .tr),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text("Close"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                              ),
                              TextSpan(
                                text: " and ".tr,
                                style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily:
                                        lang_controller.fontFamily.value,
                                    fontSize: 12.sp),
                              ),
                              const TextSpan(text: "\n"),
                              TextSpan(
                                text: "Privacy Policy".tr,
                                style: TextStyle(
                                    color: AppColors.orangeColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily:
                                        lang_controller.fontFamily.value,
                                    fontSize: 12.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Privacy Policy".tr),
                                        content: Text(
                                            "This is where your Privacy Policy content goes."
                                                .tr),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text("Close".tr),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                              ),
                              if (lang_controller.language.value == 'ar')
                                const TextSpan(
                                  text: " الخاصة بنا",
                                ),
                              const TextSpan(
                                text: ".",
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 16.w,
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 230.w,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0.w, 0.w, 16.w),
                  child: RichText(
                      text: TextSpan(
                          text: 'Aready have an Account?'.tr,
                          style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: 12.sp,
                              fontFamily: lang_controller.fontFamily.value,
                              fontWeight: FontWeight.w400),
                          children: [
                        TextSpan(
                          text: ' Log In'.tr,
                          style: TextStyle(
                              color: AppColors.orangeColor,
                              fontSize: 12.sp,
                              fontFamily: lang_controller.fontFamily.value,
                              fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(SigninScreen.routeName);
                            },
                        )
                      ])),
                )
              ],
            ),
          ),
        ));
  }
}
