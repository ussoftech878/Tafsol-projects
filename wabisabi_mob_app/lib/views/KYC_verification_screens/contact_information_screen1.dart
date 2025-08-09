import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';
import '../../controllers/theme_controller.dart';

class ContactInformationScreen1 extends GetView<KycOnBoardingController> {
  static const routeName = 'ContactInformationScreen1';
  const ContactInformationScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: _formKey,
                  child: Stack(
                    children: [
                      /// Scrollable content
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: isKeyboardVisible ? 0 : 160.h,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 60.h),

                              Text(
                                'Contact Information',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.kPrimaryColor,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Full Residential Address',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 42.h),

                              /// Country Button
                              SizedBox(
                                  width: double.infinity,
                                  child: Obx(
                                    () => OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            Get.find<ThemeController>()
                                                        .themeMode
                                                        .value ==
                                                    ThemeMode.dark
                                                ? AppColors.kDarkFieldFillColor
                                                : const Color(0xffF5F9FE),
                                        foregroundColor:
                                            const Color(0xffB3B3B3),
                                        side: const BorderSide(
                                          color: Color(0xffB3B3B3),
                                        ),
                                      ),
                                      onPressed: () {
                                        showCountryPicker(
                                          countryListTheme:
                                              CountryListThemeData(
                                            bottomSheetHeight:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.63,
                                          ),
                                          context: context,
                                          showPhoneCode: false,
                                          onSelect: (Country country) {
                                            controller.setSelectedCountry2(
                                                country.name);
                                          },
                                        );
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                controller.selectedCountry2
                                                        .value.isEmpty
                                                    ? 'Country'
                                                    : controller
                                                        .selectedCountry2.value,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: controller
                                                          .selectedCountry2
                                                          .value
                                                          .isEmpty
                                                      ? null
                                                      : Get.find<ThemeController>()
                                                                  .themeMode
                                                                  .value ==
                                                              ThemeMode.dark
                                                          ? AppColors
                                                              .kWhiteColor
                                                          : AppColors
                                                              .kBlackText,
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                svgAssets.arrowDown,
                                                color:
                                                    Get.find<ThemeController>()
                                                                .themeMode
                                                                .value ==
                                                            ThemeMode.dark
                                                        ? AppColors.kWhiteColor
                                                        : null,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(height: 16.h),

                              /// City
                              CustomTextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your City';
                                  }
                                  return null;
                                },
                                controller: controller.cityController,
                                decoration: const InputDecoration(
                                  hintText: 'City',
                                ),
                              ),
                              SizedBox(height: 16.h),
                              CustomTextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Street Number';
                                  }
                                  return null;
                                },
                                controller: controller.provinceController,
                                decoration: const InputDecoration(
                                  hintText: 'State/Province',
                                ),
                              ),
                              SizedBox(height: 16.h),

                              /// Street Number
                              CustomTextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Street Number';
                                  }
                                  return null;
                                },
                                controller: controller.streetNumberController,
                                decoration: const InputDecoration(
                                  hintText: 'Street Address',
                                ),
                              ),
                              SizedBox(height: 16.h),

                              /// Postal Code
                              CustomTextFormField(
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Postal Code';
                                  }
                                  return null;
                                },
                                controller: controller.postalCodeController,
                                decoration: const InputDecoration(
                                  hintText: 'Postal Code',
                                ),
                              ),
                              SizedBox(height: 16.h),

                              // Extra space to avoid clipping content behind the buttons
                              SizedBox(height: 80.h),
                            ],
                          ),
                        ),
                      ),

                      /// Bottom buttons
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Visibility(
                          visible: !isKeyboardVisible,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.UpdateUserDetails()
                                          .then((value) {
                                        if (value) {
                                          controller.nextPage();
                                        }
                                      });
                                    }
                                  },
                                  child: const Text('Next'),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.UpdateUserDetails()
                                          .then((value) {
                                        if (value) {
                                          Get.back();
                                        }
                                      });
                                    } else {
                                      Get.back();
                                    }
                                  },
                                  child: const Text('Save & Exit'),
                                ),
                              ),
                              SizedBox(height: 42.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
