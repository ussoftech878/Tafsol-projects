import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/select_participants_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/participants_container.dart';
import 'package:wabisabi_mob_app/widgets/agreement_creation_steps.dart';

class ViewParticipant extends StatelessWidget {
  static const routeName = 'ViewParticipant';
  const ViewParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Create Agreement'),
          ),
          body: Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 11.h, bottom: 30.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AgreementCreationSteps(
                    step: 1,
                  ),
                  Text('Selected Participants',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 13.sp, color: AppColors.kBlackText))),
                  SizedBox(height: 11.h),
                  Text(
                      'This agreement is made and entered into by John Doe and Bailey on 12/12/2025. Both parties mutually agree to the terms and conditions outlined herein, acknowledging their responsibilities and commitments.',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 13.sp,
                              color: Color(0xff4A4A4A)))),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ParticipantsContainer(
                        name: 'John Doe',
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      ParticipantsContainer(
                        name: 'Laura',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Agreement Title',
                        suffixIcon: SvgPicture.asset(
                          svgAssets.ai,
                          fit: BoxFit.scaleDown,
                        )),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Stack(
                    children: [
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Description',
                        ),
                      ),
                      Positioned(
                        right: 7.w,
                        bottom: 10.h,
                        child: SvgPicture.asset(
                          svgAssets.ai,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  // Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(SelectParticipantsScreen.routeName);
                          },
                          child: Text('Next')),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            ),
          ));
    });
  }
}
