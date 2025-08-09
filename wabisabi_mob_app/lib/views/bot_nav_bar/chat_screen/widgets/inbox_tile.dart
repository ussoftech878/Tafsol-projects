import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/msg_screen.dart';

class InboxTile extends StatelessWidget {
  const InboxTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(MsgScreen.routeName);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      svgAssets.avatar,
                      height: 50.h,
                      width: 50.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Alice Mandy',
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500))),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('Amet minim mollit non deserunt ulla...',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 11.sp))),
                    SizedBox(
                      height: 7.h,
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 8.w,
              // ),
              Expanded(
                flex: 1,
                child: Text('01:01',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 11.sp))),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 60.w, right: 0.w),
            child: const Divider(
              color: Color(0xffE8E8E8),
            ),
          ),
        ],
      ),
    );
  }
}
