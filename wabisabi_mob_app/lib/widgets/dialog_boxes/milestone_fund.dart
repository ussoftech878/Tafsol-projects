import 'dart:ui'; // Import this for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/msg_screen.dart';

void showMilestoneFundDialogBox(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent, // Set this to remove dim effect
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xffB3B3B3), width: 1),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Apply blur
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: Color(0xffB3B3B3),
                width: 1.w,
              ),
              color: Colors.white, // Set dialog background color
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Which Milestone do you want to fund?',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kBlackText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(svgAssets.dcancel,
                            width: 24.w, height: 24.h),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return MilestoneFundCard();
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offNamed(MsgScreen.routeName);
                          },
                          child: Text('Save'),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text('Cancel'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class MilestoneFundCard extends StatefulWidget {
  const MilestoneFundCard({super.key});

  @override
  State<MilestoneFundCard> createState() => _MilestoneFundCardState();
}

class _MilestoneFundCardState extends State<MilestoneFundCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15.w),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Color(0xffB3B3B3),
          )),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
            side: BorderSide(color: Color(0xFF1C1C1C), width: 1.3),
            checkColor: AppColors.kScaffoldColor,
            activeColor: AppColors.kPrimaryColor,
          ),
          Expanded(
            flex: 2,
            child: Text(
              overflow: TextOverflow.ellipsis,
              'Logo Design',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff4A4A4A),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 17.w,
          ),
          Text(
            '\$500.00',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff4A4A4A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
