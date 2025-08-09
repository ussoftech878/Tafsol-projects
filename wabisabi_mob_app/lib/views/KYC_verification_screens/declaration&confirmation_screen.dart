import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/bot_nav_bar.dart';

class DeclarationAndconfirmationScreen
    extends GetView<KycOnBoardingController> {
  static const routeName = 'DeclarationAndconfirmationScreen';

  const DeclarationAndconfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),

              Text(
                  textAlign: TextAlign.center,
                  'Declarations and Confirmations',
                  style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 23.h,
              ),
              Obx(() {
                return Text(
                    textAlign: TextAlign.start,
                    controller.questionsResponse.questions![0].header!,
                    style: TextStyle(fontSize: 14.sp));
              }),
              SizedBox(
                height: 10.h,
              ),
              Text(
                  textAlign: TextAlign.start,
                  'Question:',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),

              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => Text(
                    textAlign: TextAlign.start,
                    controller.questionsResponse.questions![0].question!,
                    style: TextStyle(
                      fontSize: 14.sp,
                    )),
              ),

              SizedBox(
                height: 10.h,
              ),
              // First Question Radio Buttons
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.85,
                            child: Radio<SingingCharacter>(
                              value: SingingCharacter.Yes,
                              groupValue: controller.selectedCharacter.value,
                              onChanged: (SingingCharacter? value) {
                                if (value != null) {
                                  controller.updateSelectedCharacter(value);
                                }
                              },
                              activeColor: AppColors.kPrimaryColor,
                            ),
                          ),
                          Text(
                            'Yes',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 14.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.85,
                            child: Radio<SingingCharacter>(
                              value: SingingCharacter.No,
                              groupValue: controller.selectedCharacter.value,
                              onChanged: (SingingCharacter? value) {
                                if (value != null) {
                                  controller.updateSelectedCharacter(value);
                                }
                              },
                              activeColor: AppColors.kPrimaryColor,
                            ),
                          ),
                          Text(
                            'No',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  )),

              Divider(),
              SizedBox(
                height: 10.h,
              ),
              Obx(() {
                return Text(
                    textAlign: TextAlign.start,
                    controller.questionsResponse.questions![1].header!,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ));
              }),

              SizedBox(
                height: 10.h,
              ),
              Text(
                  textAlign: TextAlign.start,
                  'Question:',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),

              SizedBox(
                height: 2.h,
              ),
              Obx(() {
                return Text(
                    textAlign: TextAlign.start,
                    controller.questionsResponse.questions![1].question!,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ));
              }),

              SizedBox(
                height: 10.h,
              ),

              // Second Question Radio Buttons
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.85,
                            child: Radio<SingingCharacter2>(
                              value: SingingCharacter2.Yes,
                              groupValue: controller.selectedCharacter2.value,
                              onChanged: (SingingCharacter2? value) {
                                if (value != null) {
                                  controller.updateSelectedCharacter2(value);
                                }
                              },
                              activeColor: AppColors.kPrimaryColor,
                            ),
                          ),
                          Text(
                            'Yes',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14.sp,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.85,
                            child: Radio<SingingCharacter2>(
                              value: SingingCharacter2.No,
                              groupValue: controller.selectedCharacter2.value,
                              onChanged: (SingingCharacter2? value) {
                                if (value != null) {
                                  controller.updateSelectedCharacter2(value);
                                }
                              },
                              activeColor: AppColors.kPrimaryColor,
                            ),
                          ),
                          Text(
                            'No',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14.sp,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  )),

              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.UpdateUserDetails().then((value) {
                        if (value) {
                          controller.PostQuestions().then((value) {
                            if (value) {
                              Get.toNamed(BotNavBar.routeName);
                            }
                          });
                        }
                      });
                    },
                    child: const Text('Submit')),
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
                          controller.PostQuestions().then((value) {
                            if (value) {
                              Get.back();
                            }
                          });
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
        ),
      ),
    );
  }
}
