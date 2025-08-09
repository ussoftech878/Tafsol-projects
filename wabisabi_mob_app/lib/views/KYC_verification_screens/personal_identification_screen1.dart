import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';

import '../../controllers/theme_controller.dart';

class PersonalIdentificationScreen1 extends GetView<KycOnBoardingController> {
  static const routeName = 'PersonalIdentificationScreen1';
  const PersonalIdentificationScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),

                          Text(
                              textAlign: TextAlign.center,
                              'Personal Identification',
                              style: TextStyle(
                                  color: AppColors.kPrimaryColor,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              'To comply with security and financial regulations, please provide your personal details',
                              style: TextStyle(fontSize: 14.sp)),
                          SizedBox(
                            height: 20.h,
                          ),

                          CustomTextFormField(
                            readOnly: true,
                            controller: controller.dateController,
                            decoration: const InputDecoration(
                                hintText: 'Date of Birth',
                                suffixIcon: Icon(Icons.calendar_today)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Date';
                              }
                              return null;
                            },
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2000, 1, 1),
                                firstDate: DateTime(1900, 1, 1),
                                lastDate: DateTime.now(),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: AppColors.kPrimaryColor,
                                        onPrimary: Colors.white,
                                        onSurface: Colors.black,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('MMMM d, y').format(pickedDate);
                                controller.dateController.text = formattedDate;
                              }
                            },
                          ),

                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Place Of Birth';
                              }
                              return null;
                            },
                            controller: controller.placeOfBirthController,
                            decoration: const InputDecoration(
                                hintText: 'Place Of Birth'),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Obx(
                              () => OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Get.find<ThemeController>()
                                              .themeMode
                                              .value ==
                                          ThemeMode.dark
                                      ? AppColors.kDarkFieldFillColor
                                      : const Color(0xffF5F9FE),
                                  foregroundColor: Get.find<ThemeController>()
                                              .themeMode
                                              .value ==
                                          ThemeMode.dark
                                      ? AppColors.kWhiteColor
                                      : const Color(0xffB3B3B3),
                                  side: const BorderSide(
                                    color: Color(0xffB3B3B3),
                                  ),
                                ),
                                onPressed: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: false,
                                    countryListTheme: CountryListThemeData(
                                      bottomSheetHeight:
                                          MediaQuery.of(context).size.height *
                                              0.63,
                                    ),
                                    onSelect: (Country country) {
                                      controller
                                          .setSelectedCountry(country.name);
                                      controller.nationalityController.text =
                                          country.name;
                                    },
                                  );
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.selectedCountry.value.isEmpty
                                            ? 'Nationality'
                                            : controller.selectedCountry.value,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: controller
                                                  .selectedCountry.value.isEmpty
                                              ? null
                                              : Get.find<ThemeController>()
                                                          .themeMode
                                                          .value ==
                                                      ThemeMode.dark
                                                  ? AppColors.kWhiteColor
                                                  : AppColors.kBlackText,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        svgAssets.arrowDown,
                                        color: Get.find<ThemeController>()
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
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Tax Identification Number (NIF)';
                              }
                              return null;
                            },
                            controller: controller.nIFController,
                            decoration: const InputDecoration(
                                hintText:
                                    'Tax Identification Number (NIF/TIN/SSN)'),
                          ),
                          SizedBox(
                            height: 200.h,
                          ),
                          // Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isKeyboardVisible,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  // Get.toNamed(OtpScreen.routeName);
                                  if (_formKey.currentState!.validate()) {
                                    controller.UpdateUserDetails()
                                        .then((value) {
                                      if (value) {
                                        controller.nextPage();
                                      }
                                    });
                                  }
                                },
                                child: const Text('Next')),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
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
                                  // Get.toNamed(OtpScreen.routeName);
                                },
                                child: const Text('Save & Exit')),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
