import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/onboarding_controller.dart';
import 'package:wajba_mobile_app/view/location_screen.dart';
import 'package:wajba_mobile_app/view/on_boarding_screens/onboarding_page1.dart';
import 'package:wajba_mobile_app/view/on_boarding_screens/onboarding_page2.dart';
import 'package:wajba_mobile_app/view/on_boarding_screens/onboarding_page3.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

// ignore: must_be_immutable
class OnboardingScreen extends GetView<OnboardingController> {
  static const routeName = 'OnboardingScreen';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const OnboardingPage1(),
      const OnboardingPage2(),
      const OnboardingPage3()
    ];
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75.w,
        toolbarHeight: 40.h,
        leading: Obx(() {
          return controller.currentIndex.value < 3
              ? TextButton(
                onPressed: () {
                  Get.offAllNamed(LocationScreen.routeName);
                },
                child: Text(
                  'Skip'.tr,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: const Color(0xff8E8E8E),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              )
              : const SizedBox();
        }),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 27.w),
            child: LanguageButton()
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
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
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => Container(
                    margin: EdgeInsets.only(right: 7.w),
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                      color: controller.currentIndex.value == index
                          ? AppColors.kPrimaryColor
                          : const Color(0xffE2E5E8),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 164.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 27.w, left: 27.w, bottom: 45.h),
            child: SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.nextPage,
                    child: Text(controller.currentIndex.value < 2
                        ? 'Next'.tr
                        : 'All Set!'.tr),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
