import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/signup_on_boarding_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/services/session_storage_services.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';

class PhoneNumberScreen extends GetView<SignUpOnboardingController> {
  static const routeName = 'PhoneNumberScreen';
  PhoneNumberScreen({super.key});
  SessionStorageService _sessionStorageService = SessionStorageService();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Obx(() => Text(
                      'Hi, ${controller.authResponse.user!.firstName}',
                      style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp))),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Welcome! Let’s set up your account',
                        style: TextStyle(fontSize: 14.sp)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                      textAlign: TextAlign.center,
                      'Enter your mobile number to secure your account and receive important updates.',
                      style: TextStyle(fontSize: 12.sp)),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Obx(() => TextFormField(
                              style: TextStyle(fontSize: 16.sp),
                              readOnly: true,
                              validator: (value) {
                                if (controller.countryCode.isEmpty) {
                                  controller.isCountryCodeValid.value =
                                      false; // Update validation state
                                  return 'Country code cannot be empty';
                                }
                                controller.isCountryCodeValid.value = true;
                                return null;
                              },
                              onTap: () {
                                showCountryPicker(
                                  countryListTheme: CountryListThemeData(
                                    bottomSheetHeight:
                                        MediaQuery.of(context).size.height *
                                            0.63,
                                    // backgroundColor:
                                    //     const AppColors.kDarkBottomSheetColor,
                                    inputDecoration: InputDecoration(
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                        fontSize: 12.sp,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 20.sp,
                                      ),
                                    ),
                                    searchTextStyle: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    controller
                                        .setCountryCode(country.phoneCode);
                                    controller.isCountryCodeValid.value =
                                        true; // Set valid when selected
                                  },
                                );
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 16.h),
                                filled: true,
                                fillColor: controller.isCountryCodeValid.value
                                    ? Get.find<ThemeController>()
                                                .themeMode
                                                .value ==
                                            ThemeMode.dark
                                        ? null
                                        : const Color(0xffFFF3EE)
                                    : null,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 14.w),
                                  child: Obx(() => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "+ ${controller.countryCode.value} ",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      )),
                                ),
                                suffixIcon: SvgPicture.asset(
                                  svgAssets.arrowDown,
                                  color:
                                      Get.find<ThemeController>().themeMode ==
                                              ThemeMode.dark
                                          ? AppColors.kWhiteColor
                                          : AppColors.kBlackText,
                                  height: 24.h,
                                  width: 13.w,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomTextFormField(
                          style: TextStyle(fontSize: 16.sp),
                          controller: controller.phoneNumberController,
                          decoration:
                              InputDecoration(hintText: '124 2322 1255'),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Phone Number cannot be empty';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Visibility(
                    visible: !isKeyboardVisible,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.updatePhoneNumber().then((value) {
                                    if (value) {
                                      controller.nextPage();
                                    }
                                  });
                                }
                              },
                              child: const Text('Continue'),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color),
                                    children: [
                                      TextSpan(
                                        text: 'Sign Up',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.kPrimaryColor),
                                      )
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
