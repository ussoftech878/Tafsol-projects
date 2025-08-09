import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/banking_information_screen.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/contact_information_screen1.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/declaration&confirmation_screen.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/financial_&_proffessional_screen.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/personal_identification_screen1.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/personal_identification_screen2.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/sign_in_screen.dart';

// ignore: must_be_immutable
class KycOnBoarding extends GetView<KycOnBoardingController> {
  // KycOnBoardingController controller = Get.put(KycOnBoardingController());
  static const routeName = 'KycOnBoarding';
  const KycOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const PersonalIdentificationScreen1(),
      const PersonalIdentificationScreen2(),
      const ContactInformationScreen1(),
      const FinancialAndProffessionalInfoScreen(),
      //const BankingInformationScreen(),
      const DeclarationAndconfirmationScreen(),
    ];
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return WillPopScope(
        onWillPop: () async {
          if (controller.currentIndex.value > 0) {
            controller.previousPage();
            return false;
          }
          return true;
        },
        child: PopScope(
          onPopInvoked: (didPop) {
            if (didPop) {
              Get.toNamed(SignInScreen.routeName);
            }
          },
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    itemCount: pages.length,
                    onPageChanged: (index) {
                      controller.currentIndex.value = index;
                    },
                    itemBuilder: (context, index) {
                      return pages[index];
                    },
                  ),
                ),
                Obx(() => Visibility(
                      visible: !isKeyboardVisible,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          pages.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: 12.w),
                            width: 30,
                            height: 4,
                            decoration: BoxDecoration(
                                color: controller.currentIndex.value == index
                                    ? AppColors.kPrimaryColor
                                    : Color(0xffD6DFFF),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 38.h,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
