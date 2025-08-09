import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';
import 'package:wajba_mobile_app/widgets/show_dialog_box.dart';
import 'dart:io';

import '../../../../widgets/custom_back_button_app_bar.dart';

class SupportScreen extends GetView<AccountScreenController> {
  static const routeName = 'SupportScreen';
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(title: 'Contact Us'.tr),
      resizeToAvoidBottomInset:
          true, // Ensures the body resizes when the keyboard appears

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: 27.w,
            right: 27.h,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Text('Choose topic'.tr,
                        style: TextStyle(
                            color: AppColors.kTextGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            fontFamily: controller
                                .languagecontroller.fontFamily.value)),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Select a topic...'.tr,
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text('Which order do you need help with?'.tr,
                        style: TextStyle(
                            color: AppColors.kTextGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            fontFamily: controller
                                .languagecontroller.fontFamily.value)),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        BottomSheetManager.myOrdersBottomSheet(context);
                      },
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'Select an order...'.tr,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Upload images'.tr,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.kTextGreyColor,
                          fontWeight: FontWeight.w500,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await controller.pickImage();
                      },
                      child: SvgPicture.asset(
                        svgAssets.camera,
                        width: 50.w,
                      ),
                    ),
                    Obx(() {
                      // Display the uploaded image
                      return controller.selectedImagePath.value.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Image.file(
                                File(controller.selectedImagePath.value),
                                width: double.infinity,
                                height: 30.h,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container();
                    }),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Message'.tr,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.kTextGreyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextField(
                      scrollPadding: EdgeInsets.only(bottom: 120.h),
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: '',
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                showMessageSentDialogBox(context);
                              },
                              child: Text('Submit'.tr))),
                      SizedBox(
                        height: 50.h,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
