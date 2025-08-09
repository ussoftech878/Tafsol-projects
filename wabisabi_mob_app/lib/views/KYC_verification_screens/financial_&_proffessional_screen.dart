import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';

import '../../controllers/theme_controller.dart';

class FinancialAndProffessionalInfoScreen
    extends GetView<KycOnBoardingController> {
  static const routeName = 'FinancialAndProffessionalInfoScreen';
  const FinancialAndProffessionalInfoScreen({super.key});

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
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              'Financial and Professional Information',
                              style: TextStyle(
                                  color: AppColors.kPrimaryColor,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10.h),
                          Text(
                            'To comply with financial regulations and ensure secure transactions, please provide your financial details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            height: 33.h,
                          ),
                          Obx(
                            () => Container(
                              height: 56.h,
                              decoration: BoxDecoration(
                                color: Get.find<ThemeController>()
                                            .themeMode
                                            .value ==
                                        ThemeMode.dark
                                    ? AppColors.kDarkFieldFillColor
                                    : const Color(0xFFF5F9FE),
                                borderRadius: k15BorderRadius,
                                border: Border.all(
                                  color: const Color(0xffB3B3B3),
                                  width: 1.w,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Occupation / economic activity',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: const Color(0xffB3B3B3),
                                    ),
                                  ),
                                  items: controller.items.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  value: controller.selectedValue.value!.isEmpty
                                      ? "Occupation / economic activity"
                                      : controller.selectedValue.value,
                                  onChanged: (String? newValue) {
                                    controller.updateSelectedValue(newValue);
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 56.h,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    padding: null,
                                    decoration: BoxDecoration(
                                      borderRadius: k15BorderRadius,
                                      color: Get.find<ThemeController>()
                                                  .themeMode
                                                  .value ==
                                              ThemeMode.dark
                                          ? AppColors.kDarkFieldFillColor
                                          : const Color(0xFFF5F9FE),
                                    ),
                                    offset: Offset(0, -5.h),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            controller: controller.nameOfEmployerController,
                            decoration: InputDecoration(
                                hintText: 'Employer or Company (Optional)'),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Obx(
                            () => Container(
                              height: 56.h,
                              decoration: BoxDecoration(
                                color: Get.find<ThemeController>()
                                            .themeMode
                                            .value ==
                                        ThemeMode.dark
                                    ? AppColors.kDarkFieldFillColor
                                    : const Color(0xFFF5F9FE),
                                borderRadius: k15BorderRadius,
                                border: Border.all(
                                  color: const Color(0xffB3B3B3),
                                  width: 1.w,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text(
                                    controller.selectedValue2.value ??
                                        'Estimated annual income',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: controller.selectedValue2.value ==
                                              null
                                          ? const Color(0xffB3B3B3)
                                          : Colors.black,
                                    ),
                                  ),
                                  items: controller.items2.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                    );
                                  }).toList(),
                                  value: controller.selectedValue2.value,
                                  onChanged: (String? newValue) {
                                    controller.updateSelectedValue2(newValue);
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 56.h,
                                  ),
                                  iconStyleData: IconStyleData(
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Colors.grey),
                                    iconSize: 24.sp,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    padding: null,
                                    decoration: BoxDecoration(
                                      borderRadius: k15BorderRadius,
                                      color: Get.find<ThemeController>()
                                                  .themeMode
                                                  .value ==
                                              ThemeMode.dark
                                          ? AppColors.kDarkFieldFillColor
                                          : const Color(0xFFF5F9FE),
                                    ),
                                    offset: const Offset(0, -5),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            controller: controller.sourceOfFundController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Name';
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(hintText: 'Source Of Funds'),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'E.g., salary, investments, business revenue.',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          )
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
                                  if (_formKey.currentState!.validate()) {
                                    controller.UpdateUserDetails()
                                        .then((value) {
                                      if (value) {
                                        controller.nextPage();
                                      }
                                    });
                                  }
                                  // Get.toNamed(OtpScreen.routeName);
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
                                },
                                child: const Text('Save & Exit')),
                          ),
                          SizedBox(
                            height: 42.h,
                          )
                        ],
                      ),
                    ),
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
