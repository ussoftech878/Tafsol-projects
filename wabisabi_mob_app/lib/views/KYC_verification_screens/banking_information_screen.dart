import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';

class BankingInformationScreen extends GetView<KycOnBoardingController> {
  static const routeName = 'BankingInformationScreen';
  const BankingInformationScreen({super.key});

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
                        'Banking Information',
                        style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        'Enter Your Bank Details for Secure Transactions.',
                        style: TextStyle(fontSize: 14.sp)),
                    SizedBox(
                      height: 42.h,
                    ),
                    CustomTextFormField(
                      controller: controller.iBANController,
                      decoration: InputDecoration(
                          hintText: 'IBAN or bank account number'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' IBAN Number is incorrect';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      controller: controller.nameOfBankController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your bank name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: 'Name of the bank'),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      controller: controller.swiftcodeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your SWIFT/BIC Code';
                        }
                      },
                      decoration: InputDecoration(hintText: 'SWIFT/BIC Code'),
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
                                  KycOnBoardingController controller =
                                      Get.put(KycOnBoardingController());
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
                                  controller.UpdateUserDetails().then((value) {
                                    if (value) {
                                      Get.back();
                                    }
                                  });
                                },
                                child: const Text('Save & Exit')),
                          ),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      ),
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
