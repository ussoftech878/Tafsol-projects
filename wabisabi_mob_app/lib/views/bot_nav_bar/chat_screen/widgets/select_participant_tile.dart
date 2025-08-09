import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/controllers/chat_controller.dart';

class SelectParticipantTile extends GetView<ChatController> {
  const SelectParticipantTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.toggleCheckbox();
                  },
                  child: SvgPicture.asset(
                      controller.isChecked.value
                          ? svgAssets.checkbox2
                          : svgAssets.checkbox1,
                      width: 17.w,
                      height: 17.h),
                ),
                SizedBox(
                  width: 11.w,
                ),
                Image.asset(imageAssets.person, height: 40.h, width: 40.w),
                SizedBox(
                  width: 11.w,
                ),
                Text("John Doe",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16.sp, color: Color(0xff4A4A4A)))),
              ],
            ),
            SizedBox(height: 10.h),
            Divider(
              color: Color(0xffEDEDED),
            )
          ],
        ));
  }
}
