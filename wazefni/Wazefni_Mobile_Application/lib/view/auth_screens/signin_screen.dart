import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/controllers/SignIn_controller.dart';
import 'package:wazefni_iraq/widgets/bottom_sheet.dart';
import 'package:wazefni_iraq/widgets/custom_app_bar.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/widgets/custom_textfield.dart';
import 'package:wazefni_iraq/widgets/tooltip.dart';

class SigninScreen extends StatefulWidget {
  static const routeName = 'SigninScreen';

  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen>
    with TickerProviderStateMixin {
  Languagecontroller lang_controller = Get.put(Languagecontroller());
  final SigninController controller = SigninController();
  final Languagecontroller _languageController = Languagecontroller();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _PhoneformKey = GlobalKey<FormState>();
  final List<Tab> loginTabs = <Tab>[
    Tab(
      text: "Mail".tr,
    ),
    Tab(text: "Phone".tr),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "", onPressed: () => Get.back()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome back'.tr,
                style: TextStyle(
                  fontFamily: lang_controller.fontFamily.value,
                  color: const Color(0xff141414),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'Log in to wazefni_iraq and discover thousands of jobs where we match talent with opportunities for success'
                    .tr,
                style: TextStyle(
                  fontFamily: lang_controller.fontFamily.value,
                  color: const Color(0xff474747),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 16.h),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        onTap: (value) {
                          controller.tabIndex.value = value;
                        },
                        tabs: loginTabs,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: AppColors.orangeColor,
                        labelStyle: TextStyle(
                            fontFamily: lang_controller.fontFamily.value,
                            color: const Color(0xff474747),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        unselectedLabelStyle: TextStyle(
                            color: const Color(0xff474747),
                            fontSize: 16.sp,
                            fontFamily: lang_controller.fontFamily.value,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 18.w, 0, 10.w),
                        child: SizedBox(
                          height: 182.w,
                          child: TabBarView(
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    k2hSizedBox,
                                    CustomTextFormField(
                                      // style: TextStyle(fontSize: 12.sp),
                                      keyboardType: TextInputType.emailAddress,
                                      controller: controller.emailController,
                                      onchange: () {
                                        if (_formKey.currentState!.validate()) {
                                          controller.isEnabled.value = true;
                                        } else {
                                          controller.isEnabled.value = false;
                                        } //controller.isEnabled.value = true;
                                        print(
                                            'isEnabled----------: ${controller.isEnabled.value}'); // Debugging line
                                      },
                                      validator: (value) {
                                        if (GetUtils.isNullOrBlank(value)! ||
                                            !GetUtils.isEmail(
                                                value.toString())) {
                                          return 'Invalid email address (example: example@email.com)'
                                              .tr;
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
                                            message:
                                                "Example: example@email.com".tr,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Obx(
                                      () => CustomTextFormField(
                                        isPassword: true,
                                        obscureText:
                                            !controller.isPasswordVisible.value,
                                        controller: controller.PassController,
                                        onchange: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            controller.isEnabled.value = true;
                                          } else {
                                            controller.isEnabled.value = false;
                                          }
                                        },
                                        validator: (value) {
                                          if (GetUtils.isNullOrBlank(value)!) {
                                            return 'Please enter your password'
                                                .tr;
                                          } else if (value!.length < 6) {
                                            return 'The password must be at least 6 numbers or letters'
                                                .tr;
                                          }
                                          return null;
                                        },
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
                                              controller
                                                      .isPasswordVisible.value =
                                                  !controller
                                                      .isPasswordVisible.value;
                                            },
                                            icon: controller
                                                    .isPasswordVisible.value
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
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            BottomSheetManager
                                                .forgetPassBottomSheet(context);
                                          },
                                          child: Text(
                                            "Forgot your Password?".tr,
                                            style: TextStyle(
                                                color: AppColors.orangeColor,
                                                fontFamily: lang_controller
                                                    .fontFamily.value,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp),
                                          ),
                                        )
                                      ],
                                    ),

                                    // k3hSizedBox
                                  ],
                                ),
                              ),
                              Form(
                                key: _PhoneformKey,
                                child: Column(
                                  children: [
                                    k2hSizedBox,
                                    Row(
                                      textDirection: TextDirection.ltr,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                            controller:
                                                controller.PhoneController,
                                            onchange: () {
                                              if (_PhoneformKey.currentState!
                                                  .validate()) {
                                                controller.isEnabled.value =
                                                    true;
                                              } else {
                                                controller.isEnabled.value =
                                                    false;
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
                                                  message:
                                                      "Example: 123-456-7890"
                                                          .tr,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Obx(
                                      () => CustomTextFormField(
                                        isPassword: true,
                                        onchange: () {
                                          if (_PhoneformKey.currentState!
                                              .validate()) {
                                            controller.isEnabled.value = true;
                                          } else {
                                            controller.isEnabled.value = false;
                                          } //controller.isEnabled.value = true;
                                        },
                                        controller:
                                            controller.PhonePassController,
                                        validator: (value) {
                                          if (GetUtils.isNullOrBlank(value)!) {
                                            return 'Please enter your password'
                                                .tr;
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
                                          prefixIcon: SvgPicture.asset(
                                            svgAssets.square_lock2,
                                            fit: BoxFit.scaleDown,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              controller
                                                      .isPasswordVisible.value =
                                                  !controller
                                                      .isPasswordVisible.value;
                                            },
                                            icon: controller
                                                    .isPasswordVisible.value
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
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            BottomSheetManager
                                                .phoneforgetPassBottomSheet(
                                                    context);
                                          },
                                          child: Text(
                                            "Forgot your Password?".tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color:
                                                        AppColors.orangeColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: lang_controller
                                                        .fontFamily.value,
                                                    fontSize: 12.sp),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      controller.tabIndex.value == 0
                          ? LoginButton(
                              formKey: _formKey,
                              PhoneformKey: _PhoneformKey,
                              lang_controller: lang_controller,
                              controller: controller,
                            )
                          : LoginButton(
                              PhoneformKey: _PhoneformKey,
                              lang_controller: lang_controller,
                              controller: controller,
                              formKey: _formKey,
                            ),
                    ],
                  ),
                ),
              ),

              Column(
                children: [
                  SvgPicture.asset(svgAssets.orr),
                  SizedBox(
                    height: 12.h,
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

              //Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(0.w, 140.w, 0.w, 18.w),
                child: SizedBox(
                  height: 16.h,
                  width: 267.w,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'account check'.tr,
                          style: TextStyle(
                              fontFamily: lang_controller.fontFamily.value,
                              color: const Color(0xff474747),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.back();
                                },
                              text: 'Create a new account'.tr,
                              style: TextStyle(
                                fontFamily: lang_controller.fontFamily.value,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.orangeColor,
                              ),
                            )
                          ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> PhoneformKey,
    required this.lang_controller,
    required this.controller,
    required this.formKey,
  }) : _PhoneformKey = PhoneformKey;

  final GlobalKey<FormState> _PhoneformKey;
  final GlobalKey<FormState> formKey;
  final Languagecontroller lang_controller;
  final SigninController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    // controller.isEnabled.value ? null : const Color(0xffFFD8BF),
                    controller.isEnabled.value ? null : Color(0xffFFD8BF),
              ),
              onPressed: () {
                controller.isEnabled.value
                    ? () {
                        controller.tabIndex.value == 0
                            ? {
                                if (formKey.currentState!.validate())
                                  {print("fallout 4")}
                              }
                            : {
                                if (_PhoneformKey.currentState!.validate())
                                  {"fallout 3"}
                              };
                      }
                    : null;
              },

              // Disable button when isEnabled is false
              child: Text("Login".tr,
                  style: TextStyle(
                      fontFamily: lang_controller.fontFamily.value,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp))));
    });
  }
}
