import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/create_agreement_controller.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/view_participant.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/contract_card.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/milestone_missed_card.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/milestone_request_card.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/resolve_contract_card.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/view_extension_card.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/block_user.dart';
import 'package:wabisabi_mob_app/widgets/reciever_msg.dart';
import 'package:wabisabi_mob_app/widgets/sender_msg.dart';
import 'package:wabisabi_mob_app/widgets/suggestion_text.dart';

class MsgScreen extends GetView<CreateAgreementController> {
  static const routeName = 'MsgScreen';
  const MsgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 30.w,
          // leading: IconButton(
          //     onPressed: () {
          //       Get.back();
          //     },
          //     icon: Padding(
          //       padding: EdgeInsets.only(left: 3.w),
          //       child: const Icon(Icons.arrow_back),
          //     )),
          title: Row(
            children: [
              SvgPicture.asset(
                svgAssets.avatar,
                height: 50.h,
                width: 50.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alice Mandy',
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w500))),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Active Now',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 8.sp, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: SvgPicture.asset(svgAssets.searchicon,
                  height: 24.h,
                  width: 24.w,
                  color: Get.find<ThemeController>().themeMode.value ==
                          ThemeMode.dark
                      ? AppColors.kWhiteColor
                      : null),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(ViewParticipant.routeName);
                },
                child: SvgPicture.asset(
                  svgAssets.sm3,
                  height: 22.h,
                  width: 22.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: PopupMenuButton<String>(
                offset: Offset(0, 30.h),
                color: Colors.white,
                padding: EdgeInsets.zero,
                //borderRadius: BorderRadius.circular(10.r),
                onSelected: (value) {
                  switch (value) {
                    case 'contact_history':
                      break;
                    case 'settings':
                      break;
                    case 'block_user':
                      controller.openDialog();
                      break;
                    case 'view_agreement':
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'contact_history',
                    child: Column(
                      children: [
                        Text(
                          'Contact History',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp, color: Color(0xff63809A))),
                        ),
                        SizedBox(height: 5.h),
                        Divider(
                          color: Color(0xffE9E9E9),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'settings',
                    child: Column(
                      children: [
                        Text(
                          'Settings',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp, color: Color(0xff63809A))),
                        ),
                        SizedBox(height: 5.h),
                        Divider(
                          color: Color(0xffE9E9E9),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'block_user',
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showBlockUserDialogBox(context);
                          },
                          child: Text(
                            'Block User',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14.sp, color: Color(0xff63809A))),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Divider(
                          color: Color(0xffE9E9E9),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'view_agreement',
                    child: Center(
                      child: Text(
                        'View Agreement',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14.sp, color: Color(0xff63809A))),
                      ),
                    ),
                  ),
                ],
                child: SvgPicture.asset(svgAssets.menu,
                    height: 21.h,
                    width: 5.w,
                    color: Get.find<ThemeController>().themeMode.value ==
                            ThemeMode.dark
                        ? AppColors.kWhiteColor
                        : null),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, top: 43.h, right: 24.w),
                child: SingleChildScrollView(
                  // reverse: true, // Ensures the last message is visible
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
                      Center(
                        child: Text('Bob has created the agreement.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xffFF7F50),
                                    fontWeight: FontWeight.w500))),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      ContractCard(),
                      SizedBox(
                        height: 10.h,
                      ),
                      SenderMsg(),
                      SizedBox(
                        height: 17.h,
                      ),
                      Center(
                        child: Text('Alice has Approved the agreement.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xffFF7F50),
                                    fontWeight: FontWeight.w500))),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      MilestoneRequestCard(),
                      SizedBox(
                        height: 10.h,
                      ),
                      SenderMsg(),
                      SizedBox(
                        height: 17.h,
                      ),
                      Center(
                        child: Text('Alice Milestone Deadline has been missed',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xffFF7F50),
                                    fontWeight: FontWeight.w500))),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      MilestoneMissedCard(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Text('Alice has requested a Mediation',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xffFF7F50),
                                    fontWeight: FontWeight.w500))),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ViewExtensionCard(),
                      SizedBox(
                        height: 10.h,
                      ),
                      ResolveContractCard(),
                      SizedBox(
                        height: 10.h,
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
                              color:
                                  Get.find<ThemeController>().themeMode.value ==
                                          ThemeMode.dark
                                      ? AppColors.kWhiteColor
                                      : null),
                          SizedBox(width: 7.w),
                          SvgPicture.asset(svgAssets.scan,
                              width: 20.w,
                              height: 20.h,
                              color:
                                  Get.find<ThemeController>().themeMode.value ==
                                          ThemeMode.dark
                                      ? AppColors.kWhiteColor
                                      : null),
                          SizedBox(width: 7.w),
                          SvgPicture.asset(svgAssets.link,
                              width: 20.w,
                              height: 20.h,
                              color:
                                  Get.find<ThemeController>().themeMode.value ==
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
  }
}
