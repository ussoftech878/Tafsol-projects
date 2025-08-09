import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/controllers/onboarding_controller.dart';
import 'package:wazefni_iraq/view/on_boarding_screens/onboarding_page1.dart';
import 'package:wazefni_iraq/view/on_boarding_screens/onboarding_page2.dart';
import 'package:wazefni_iraq/view/on_boarding_screens/onboarding_page3.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  OnboardingController controller = Get.put(OnboardingController());
  Languagecontroller lang_controller = Get.put(Languagecontroller());
  static const routeName = 'OnboardingScreen';

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [OnboardingPage1(), OnboardingPage2(), OnboardingPage3()];
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(0.00, -1.00),
        end: Alignment(0, 2),
        colors: [AppColors.orangeLightColor2, AppColors.whiteColor],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
            // Spacer(),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 18.w, right: 18.w, bottom: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: controller.currentIndex.value > 0
                              ? () {
                                  controller.previousPage();
                                }
                              : null, // Disable when index is 0

                          child: lang_controller.language.value == "en"
                              ? SvgPicture.asset(
                                  svgAssets.arrow_back,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.greyColor.withOpacity(
                                        controller.currentIndex.value > 0
                                            ? 1
                                            : 0.5),
                                    BlendMode.srcIn,
                                  ),
                                )
                              : SvgPicture.asset(
                                  svgAssets.arrow_forward,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.greyColor.withOpacity(
                                        controller.currentIndex.value > 0
                                            ? 1
                                            : 0.5),
                                    BlendMode.srcIn,
                                  ),
                                )),
                      Center(
                          child: controller.currentIndex.value == 0
                              ? SvgPicture.asset(
                                  svgAssets.onboarding_loader_1,
                                  width: 34.w,
                                )
                              : controller.currentIndex.value == 1
                                  ? SvgPicture.asset(
                                      svgAssets.onboarding_loader_2,
                                      width: 34.w,
                                    )
                                  : SvgPicture.asset(
                                      svgAssets.onboarding_loader_3,
                                      width: 34.w,
                                    ) /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pages.length,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              width: 15.w,
                              height: 4.w,
                              decoration: BoxDecoration(
                                  color: controller.currentIndex.value == index
                                      ? AppColors.orangeColor
                                      : Colors.grey,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),*/
                          ),
                      TextButton(
                          onPressed: () {
                            controller.nextPage();
                          },
                          child: controller.currentIndex < 2
                              ? Row(
                                  children: [
                                    lang_controller.language.value == "en"
                                        ? SvgPicture.asset(
                                            svgAssets.arrow_forward,
                                            colorFilter: ColorFilter.mode(
                                              AppColors.greyColor,
                                              BlendMode.srcIn,
                                            ),
                                          )
                                        : SvgPicture.asset(
                                            svgAssets.arrow_back,
                                            colorFilter: ColorFilter.mode(
                                              AppColors.greyColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                  ],
                                )
                              : SizedBox(
                                  height: 49.3.w,
                                  width: 49.w,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                          child: SvgPicture.asset(
                                              svgAssets.start_button)),
                                      Center(
                                          child: Text(
                                        "Start".tr,
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 12.sp,
                                            fontFamily: lang_controller
                                                .fontFamily.value,
                                            fontWeight: FontWeight.w700),
                                      ))
                                    ],
                                  ),
                                )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
