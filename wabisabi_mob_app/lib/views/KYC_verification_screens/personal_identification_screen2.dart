import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/services/customPrint.dart';

import '../../controllers/theme_controller.dart';

class PersonalIdentificationScreen2 extends GetView<KycOnBoardingController> {
  static const routeName = 'PersonalIdentificationScreen2';
  const PersonalIdentificationScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
              ),

              Text(
                  textAlign: TextAlign.center,
                  'Personal Identification',
                  style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold)),

              SizedBox(
                height: 10.h,
              ),
              Text(
                  textAlign: TextAlign.center,
                  'Upload a valid ID (options: DNI, passport, or residency card).',
                  style: TextStyle(fontSize: 14.sp)),
              SizedBox(
                height: 20.h,
              ),
              UploadContainer(
                svg: SvgPicture.asset(
                  svgAssets.camera,
                  width: 32.w,
                ),
                text: 'Take Photo',
              ),
              SizedBox(
                height: 16.h,
              ),
              UploadContainer(
                svg: SvgPicture.asset(
                  svgAssets.upload,
                  width: 32.w,
                ),
                text: 'Upload Your File',
                selectImage: true,
              ),
              // SizedBox(
              //   height: 13.h,
              // ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.UpdateUserDetails().then((value) {
                        if (value) {
                          controller.nextPage();
                        }
                      });
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadContainer extends GetView<KycOnBoardingController> {
  final Widget svg;
  final String text;
  bool selectImage;
  UploadContainer(
      {super.key,
      required this.svg,
      required this.text,
      this.selectImage = false});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          selectImage
              ? controller.pickImageFromFileExplorer()
              : controller.captureImage();
        },
        child: Container(
          height: 122.h,
          width: 223.w,
          decoration: BoxDecoration(
              color:
                  Get.find<ThemeController>().themeMode.value == ThemeMode.dark
                      ? AppColors.kDarkFieldFillColor
                      : const Color(0xffF5F9FE),
              borderRadius: k15BorderRadius,
              border: Border.all(color: const Color(0xffB3B3B3), width: 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              svg,
              SizedBox(
                height: 12.h,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
