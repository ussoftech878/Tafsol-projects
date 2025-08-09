// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/create_agreement.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/doc_container.dart';
import 'package:wabisabi_mob_app/widgets/agreement_creation_steps.dart';

class ChooseAgreementType extends StatelessWidget {
  static const routeName = 'ChooseAgreementType';
  const ChooseAgreementType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Agreement'),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 11.h, right: 25.w, left: 25.w, bottom: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AgreementCreationSteps(
              step: 2,
            ),
            Text('Choose Agreement Type',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 13.sp, color: AppColors.kBlackText))),
            SizedBox(height: 25.h),
            Wrap(
              runSpacing: 15.h,
              spacing: 8.w,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => CreateAgreement(),
                        arguments: {'isEditing': false});
                  },
                  child: Container(
                    width: 109.w,
                    height: 157.h,
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 20.w, vertical: 46.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // Shadow color
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 43.w, color: Color(0xffAFAFAF)),
                        SizedBox(height: 10.h),
                        Text(
                          'Create New',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp,
                                  color: Color(0xff4A4A4A))),
                        )
                      ],
                    ),
                  ),
                ),
                DocContainer(),
                DocContainer(),
                DocContainer(),
                DocContainer(),
                DocContainer(),
                DocContainer(),
                DocContainer(),
                DocContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
