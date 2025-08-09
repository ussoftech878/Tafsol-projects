import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/chat_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/choose_agreement_type.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/select_participant_tile.dart';
import 'package:wabisabi_mob_app/widgets/agreement_creation_steps.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/add_new_participant.dart';

class SelectParticipantsScreen extends GetView<ChatController> {
  static const routeName = 'SelectParticipantsScreen';
  const SelectParticipantsScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AgreementCreationSteps(
              step: 1,
            ),
            Row(
              children: [
                Text('Select Participants',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 13.sp, color: AppColors.kBlackText))),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      showAddNewParticipantDialogBox(context);
                    },
                    child: SvgPicture.asset(svgAssets.add,
                        width: 24.w, height: 24.h)),
              ],
            ),
            SizedBox(height: 11.h),
            Expanded(
                child: ListView.builder(
                    // padding: EdgeInsets.only(bottom: 100.h),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SelectParticipantTile();
                    })),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(ChooseAgreementType.routeName);
                  },
                  child: Text('Next')),
            )
          ],
        ),
      ),
    );
  }
}
