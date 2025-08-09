import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/controllers/signupController.dart';
import 'package:wazefni_iraq/view/auth_screens/email_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/otp_general_sc.dart';
import 'package:wazefni_iraq/view/auth_screens/phone_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/signin_screen.dart';
import 'package:wazefni_iraq/widgets/bottom_sheet.dart';
import 'package:wazefni_iraq/widgets/custom_app_bar.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/view/auth_screens/otp_screen.dart';
import 'package:wazefni_iraq/widgets/custom_textfield.dart';
import 'package:wazefni_iraq/widgets/tooltip.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = 'SignupScreen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyPhone = GlobalKey<FormState>();
  final Signupcontroller controller = Get.put(Signupcontroller());
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyAppBar(title: "", onPressed: () => Get.back()),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Create a new account'.tr,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                      fontFamily: lang_controller.fontFamily.value),
                ),
                SizedBox(
                  height: 12.w,
                ),
                Text('Sigup description'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor,
                        fontFamily: lang_controller.fontFamily.value)),
                SizedBox(
                  height: 24.w,
                ),
                TabBar(
                  onTap: (value) {
                    controller.tabIndex.value = value;
                  },
                  indicatorColor: AppColors.orangeColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: lang_controller.fontFamily.value,
                      color: AppColors.blackColor),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: lang_controller.fontFamily.value,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyColor),
                  tabs: [
                    Tab(
                        child: Text(
                      textAlign: TextAlign.center,
                      'Mail'.tr,
                    )),
                    Tab(
                        child: Text(
                      textAlign: TextAlign.center,
                      'Phone'.tr,
                    )),
                  ],
                ),
                SizedBox(
                  height: 16.w,
                ),
                SizedBox(
                  height: 240.w,
                  child: TabBarView(children: [
                    Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextFormField(
                                controller: controller.fullnameController,
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
                                  hintText: "Full Name".tr,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: SvgPicture.asset(
                                    width: 20,
                                    height: 20,
                                    svgAssets.user,
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
                                  } else if (!GetUtils.isEmail(
                                      value.toString())) {
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
                                  controller: controller.passwordController,
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
                                  obscureText:
                                      !controller.isPasswordVisible.value,
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
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKeyPhone,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextFormField(
                                controller: controller.PHfullnameController,
                                onchange: () {
                                  if (_formKeyPhone.currentState!.validate()) {
                                    controller.isEnabled.value = true;
                                  } else {
                                    controller.isEnabled.value = false;
                                  } //controller.isEnabled.value = true;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field requires at least the binary name'
                                        .tr;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Full Name".tr,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: SvgPicture.asset(
                                    width: 20,
                                    height: 20,
                                    svgAssets.user,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  suffixIcon: CustomTooltip(
                                      message: "At least a binary name".tr),
                                ),
                              ),
                              SizedBox(
                                height: 16.w,
                              ),
                              Row(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "+964",
                                          prefixIconConstraints:
                                              BoxConstraints.tight(
                                                  Size(40.w, 40.w)),
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
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: CustomTextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: controller.PHphoneController,
                                      onchange: () {
                                        if (_formKeyPhone.currentState!
                                            .validate()) {
                                          controller.isEnabled.value = true;
                                        } else {
                                          controller.isEnabled.value = false;
                                        } //controller.isEnabled.value = true;
                                      },
                                      validator: (value) {
                                        if (value!.length < 6) {
                                          return 'Invalid phone number (example: xxx-xxx-xxx)'
                                              .tr;
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
                                ],
                              ),
                              SizedBox(
                                height: 16.w,
                              ),
                              Obx(
                                () => CustomTextFormField(
                                  isPassword: true,
                                  controller: controller.PHpasswordController,
                                  onchange: () {
                                    if (_formKeyPhone.currentState!
                                        .validate()) {
                                      controller.isEnabled.value = true;
                                    } else {
                                      controller.isEnabled.value = false;
                                    } //controller.isEnabled.value = true;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "The password must be at least 6 numbers or letters"
                                          .tr;
                                    } else if (value.length < 6) {
                                      return "The password must be at least 6 numbers or letters"
                                          .tr;
                                    }
                                    return null;
                                  },
                                  obscureText:
                                      !controller.isPHPasswordVisible.value,
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
                                        controller.isPHPasswordVisible.value =
                                            !controller
                                                .isPHPasswordVisible.value;
                                      },
                                      icon: controller.isPHPasswordVisible.value
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
                    ),
                  ]),
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
                                  ? controller.tabIndex.value == 0
                                      ? {
                                          if (_formKey.currentState!.validate())
                                            {
                                              Get.toNamed(
                                                Otp_General_Sc.routeName,
                                                arguments: {
                                                  'routeToGo':
                                                      EmailInfoScreen.routeName,
                                                  'Title': 'Email Confirmation',
                                                  'SubTitle':
                                                      'Enter the confirmation code sent via email to ',
                                                  'subtext':
                                                      "example@email.com",
                                                  'editText': "Edit Email"
                                                },
                                              )
                                            }
                                        }
                                      : {
                                          if (_formKeyPhone.currentState!
                                              .validate())
                                            {
                                              Get.toNamed(
                                                Otp_General_Sc.routeName,
                                                arguments: {
                                                  'routeToGo':
                                                      PhoneInfoScreen.routeName,
                                                  'Title':
                                                      'Enter Confirmation Code',
                                                  'SubTitle':
                                                      'The confirmation code sent via Whatsapp to ',
                                                  'subtext': "+964 123456789",
                                                  'editText': "Edit Phone"
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/png/Line 1.png"),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text("or".tr,
                              style: TextStyle(
                                  fontFamily: lang_controller.fontFamily.value,
                                  color: const Color(0xff474747),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            width: 3.w,
                          ),
                          Image.asset("assets/png/Line 1.png")
                        ]),
                    SizedBox(
                      height: 12.w,
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffEBEBEB),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              svgAssets.facebook,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffEBEBEB),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(svgAssets.google),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 114.h, 0.w, 16.w),
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
        ),
      ),
    );
  }
}
