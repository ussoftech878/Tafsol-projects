import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/view_extension_request.dart';

class ResolveContractCard extends StatelessWidget {
  const ResolveContractCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: AppColors.kScaffoldColor,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: Color(0xffB3B3B3),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 20,
                          child: Text(
                            'Alice has requested to resolve the contract',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4A4A4A))),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showViewExtensionRequestDialogBox(context);
                          },
                          child: Text(
                            'View',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kPrimaryColor)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                        'Both parties will have to pay the price of partial refunds, payment withholding. the amount is \$50.00.',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff4A4A4A)))),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  textStyle: TextStyle(
                                      color: AppColors.kBlackText,
                                      fontFamily: 'Poppins',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.r)),
                                  backgroundColor: Color(0xff34C759),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                ),
                                child: Text('Approve'))),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  textStyle: TextStyle(
                                      color: AppColors.kBlackText,
                                      fontFamily: 'Poppins',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.r)),
                                  backgroundColor: Color(0xffFD2727),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                ),
                                child: Text('Reject'))),
                      ],
                    )
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
    );
  }
}
