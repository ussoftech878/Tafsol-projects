import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/preview_screen.dart';

class ContractCard extends StatelessWidget {
  const ContractCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: AppColors.kScaffoldColor,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.2), // Shadow color
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3), // Shadow position
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Title:',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff141414))),
                              ),
                              Text(
                                ' Agreement Title Here',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff989898))),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => PreviewScreen(),
                                      arguments: {'isViewContract': true, 'isEditing': true});
                                  // Get.toNamed(PreviewScreen.routeName);
                                },
                                child: Text(
                                  'View Contract',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: AppColors.kPrimaryColor)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 11.h),
                          Row(
                            children: [
                              Text(
                                'Agreement Type:',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff141414))),
                              ),
                              Text(
                                ' Fixed Price',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff989898))),
                              ),
                            ],
                          ),
                          SizedBox(height: 11.h),
                          Row(
                            children: [
                              Text(
                                'Description:',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff141414))),
                              ),
                              Expanded(
                                child: Text(
                                  ' Client feedback required before proceeding to the next stage.',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color(0xff989898))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 11.h),
                          Row(
                            children: [
                              Text(
                                'Additional Notes:',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff141414))),
                              ),
                              Expanded(
                                child: Text(
                                  ' Client feedback required before proceeding to the next stage.',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color(0xff989898))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 11.h),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('03:12  AM',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff999999)))),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Image.asset(imageAssets.person, width: 24.w, height: 24.h),
            ],
          ),
        ],
      ),
    );
  }
}
