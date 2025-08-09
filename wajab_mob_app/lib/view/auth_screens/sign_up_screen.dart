import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/ccp_controller.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/auth_screens/otp_screen.dart';
import 'package:wajba_mobile_app/widgets/input_formatter.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

import '../../widgets/custom_back_button_app_bar.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  CcpController ccpController = Get.put(CcpController());
  Languagecontroller languagecontroller = Get.put(Languagecontroller());
  static const routeName = 'SignUpScreen';
  SignUpScreen({super.key});

  // String selectedCountryCode = '+973';
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: CustomBackButtonAppBar(
        title: 'Create Account'.tr,
        actionsButton: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w), child: LanguageButton())
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 27.w, right: 27.w, bottom: 27.h, top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone Number'.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff868787),
                  fontFamily: languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(
              height: 10.h,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Hero(
                tag: 'phone',
                child: TextField(
                  onChanged: (text) {
                    // Handle phone number changes
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
                                  countryListTheme: CountryListThemeData(
                                      bottomSheetHeight: 560.h,
                                      padding: EdgeInsets.only(
                                          top: 15.h,
                                          bottom: 27.h,
                                          left: 27.w,
                                          right: 27.w)),
                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    ccpController.selectedCountryCode.value =
                                        '+${country.phoneCode}';
                                    ccpController.selectedFlag.value =
                                        country.flagEmoji;
                                  },
                                );
                              },
                              child: Obx(
                                () => Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 12.w, right: 4.w),
                                      child: Text(
                                        ccpController.selectedFlag.value,
                                        style: TextStyle(
                                            fontSize:
                                                17.sp), // Adjust flag size
                                      ),
                                    ),
                                    Text(
                                      ccpController.selectedCountryCode.value,
                                      style: TextStyle(
                                        color: AppColors.forestColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: languagecontroller.fontFamily.value,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 14.3.h),
                            child: const VerticalDivider(
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(OtpScreen.routeName);
                  },
                  child: Text('Continue'.tr)),
            ),
          ],
        ),
      ),
    );
  }
}
