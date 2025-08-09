import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';

import 'package:wabisabi_mob_app/widgets/reciever_msg.dart';
import 'package:wabisabi_mob_app/widgets/sender_msg.dart';
import 'package:wabisabi_mob_app/widgets/suggestion_text.dart';

class ChatbotScreen extends StatelessWidget {
  static const routeName = 'ChatbotScreen';
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 40.w,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: 7.w),
                  child: const Icon(Icons.arrow_back),
                )),
            title: Row(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      svgAssets.avatar,
                      width: 50.w,
                    ),
                    Positioned(
                      top: 2.h,
                      right: 2.w,
                      child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.w),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chat Bot', style: TextStyle(fontSize: 17.sp)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Active Now',
                      style:
                          TextStyle(color: Color(0xff666363), fontSize: 8.sp),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: SvgPicture.asset(svgAssets.searchicon,
                    color: Get.find<ThemeController>().themeMode.value ==
                            ThemeMode.dark
                        ? AppColors.kWhiteColor
                        : null,
                    width: 24.w,
                    height: 24.h),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, top: 43.h, right: 24.w),
                  child: SingleChildScrollView(
                    // reverse: true, // Ensures the last message is visibleC
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        k4hSizedBox,
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Today',
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff979C9E),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        RecieverMsg(),
                        SizedBox(height: 10.h),
                        SenderMsg(),
                        SizedBox(
                          height: 17.h,
                        ),
                        RecieverMsg(),
                        SizedBox(
                          height: 17.h,
                        ),
                        SenderMsg(),
                        SizedBox(
                          height: 17.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom input field with typing indicator
              Container(
                padding: EdgeInsets.only(
                    left: 24.w, bottom: 18.h, right: 24.w, top: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Image.asset(imageAssets.person,
                            width: 24.w, height: 24.h),
                        SizedBox(width: 8.w),
                        Text(
                          'Typing...',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14.sp, color: Color(0xff979C9E)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 13.h),
                    SuggestionText(),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(svgAssets.camera2,
                                width: 20.w,
                                height: 20.h,
                                color: Get.find<ThemeController>()
                                            .themeMode
                                            .value ==
                                        ThemeMode.dark
                                    ? AppColors.kWhiteColor
                                    : null),
                            SizedBox(width: 7.w),
                            SvgPicture.asset(svgAssets.scan,
                                width: 20.w,
                                height: 20.h,
                                color: Get.find<ThemeController>()
                                            .themeMode
                                            .value ==
                                        ThemeMode.dark
                                    ? AppColors.kWhiteColor
                                    : null),
                            SizedBox(width: 7.w),
                            SvgPicture.asset(svgAssets.link,
                                width: 20.w,
                                height: 20.h,
                                color: Get.find<ThemeController>()
                                            .themeMode
                                            .value ==
                                        ThemeMode.dark
                                    ? AppColors.kWhiteColor
                                    : null),
                          ],
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 3,
                          child: Container(
                            // margin: EdgeInsets.only(left: 5.w),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 15.h),
                                hintText: 'Type your messages',
                                hintStyle: TextStyle(
                                  color: Color(0xff72777A),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                suffixIcon: SvgPicture.asset(
                                  svgAssets.sendIcon,
                                  fit: BoxFit.scaleDown,
                                ),
                                filled: true,
                                fillColor: AppColors.kScaffoldColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:
                                      BorderSide(color: Color(0xffE3E5E5)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:
                                      BorderSide(color: Color(0xffE3E5E5)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:
                                      BorderSide(color: Color(0xffE3E5E5)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
