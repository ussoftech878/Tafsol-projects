import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';

class ContactInformationScreen2 extends GetView<KycOnBoardingController> {
  static const routeName = 'ContactInformationScreen2';
  const ContactInformationScreen2({super.key});

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        'Contact Information',
                        style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        'Full Residential Address',
                        style: TextStyle(
                            color: AppColors.kBlackText, fontSize: 14.sp)),
                    SizedBox(
                      height: 42.h,
                    ),
                    IntlPhoneField(
                      dropdownTextStyle: TextStyle(fontSize: 15.sp),
                      controller: controller.phoneNumberController,
                      flagsButtonPadding: const EdgeInsets.only(left: 10),
                      dropdownIconPosition: IconPosition.trailing,
                      keyboardType: TextInputType.phone,
                      showCountryFlag: false,
                      textAlign: TextAlign.start,
                      showDropdownIcon: true,
                      style: TextStyle(fontSize: 16.sp),
                      decoration: const InputDecoration(
                        counterStyle: TextStyle(
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      disableLengthCheck: true,
                      initialCountryCode: 'IQ',
                      onChanged: (phone) {
                        if (kDebugMode) {
                          print(phone.completeNumber);
                        }
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email cannot be empty';
                        } else if (!GetUtils.isEmail(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: 'Email Address'),
                    ),
                    Spacer(),
                    Visibility(
                      visible: !isKeyboardVisible,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.nextPage();
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
                                  // Get.toNamed(OtpScreen.routeName);
                                },
                                child: const Text('Save & Exit')),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
