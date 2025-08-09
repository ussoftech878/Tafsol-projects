import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/reset_password_controller.dart';
import 'package:wajba_mobile_app/view/auth_screens/otp_screen.dart';
import 'package:wajba_mobile_app/widgets/custom_back_button_app_bar.dart';
import 'package:wajba_mobile_app/widgets/input_formatter.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

// ignore: must_be_immutable
class ResetPassword extends StatelessWidget {
  static const routeName = 'ResetPassword';
  ResetPassword({super.key});

  ResetPasswordController controller = Get.put(ResetPasswordController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(
        title: 'Reset Password'.tr,
        actionsButton: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: LanguageButton())
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 27.w, right: 27.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone Number'.tr,
                style: TextStyle(
                    color: AppColors.kTextGreyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    fontFamily:
                        controller.languagecontroller.fontFamily.value)),
            SizedBox(
              height: 10.h,
            ),
            Form(
              key: _formKey,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: TextFormField(
                  controller: controller.resetPhoneController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Phone number must be at least 6 characters long.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (_formKey.currentState!.validate()) {
                      controller.isEnabled.value = true;
                    } else {
                      controller.isEnabled.value = false;
                    }
                  },
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    PhoneNumberInputFormatter(),
                  ],
                  decoration: InputDecoration(
                    hintText: '3333 3333',
                    prefixIcon: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                              onTap: () {
                                // Open country picker dialog
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    controller.ccpController.selectedCountryCode
                                        .value = '+${country.phoneCode}';
                                    controller.ccpController.selectedFlag.value =
                                        country.flagEmoji;
                                  },
                                );
                              },
                              child: Obx(
                                () => Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(start: 12.w, end: 4.w),
                                      child: Text(
                                        controller
                                            .ccpController.selectedFlag.value,
                                        style: TextStyle(
                                            fontSize: 17.sp), // Adjust flag size
                                      ),
                                    ),
                                    Text(
                                      controller.ccpController.selectedCountryCode
                                          .value,
                                      style: TextStyle(
                                        color: AppColors.forestColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: controller
                                            .languagecontroller.fontFamily.value,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 11.0),
                            child: VerticalDivider(
                              color: Color(0xffE2E5E8),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Hero(
              tag: "animate",
              child: SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.isEnabled.value
                          ? null
                          : const Color(0xffE2E5E8),
                      foregroundColor:
                          controller.isEnabled.value ? null : Colors.yellow,
                    ).copyWith(
                      backgroundColor: controller.isEnabled.value
                          ? null // Default color when enabled
                          : WidgetStateProperty.all<Color>(
                              const Color(0xffE2E5E8)), // Color when disabled
                      foregroundColor: controller.isEnabled.value
                          ? null // Default text color when enabled
                          : WidgetStateProperty.all<Color>(const Color(
                              0xff868787)), // Text color when disabled
                    ),
                    onPressed: controller.isEnabled.value
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              Get.toNamed(OtpScreen.routeName, arguments: true);
                            }
                          }
                        : null,
                    child: Text('Reset Password'.tr),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
