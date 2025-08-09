import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/request_extension.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/request_mediation.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/resolve_contract.dart';

class MilestoneMissedCard extends StatelessWidget {
  const MilestoneMissedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.kScaffoldColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select one to proceed further',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.kBlackText,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {
                showRequestExtensionDialogBox(context);
              },
              child: OptionContainer(
                title: 'Request an Extension',
              ),
            ),
            GestureDetector(
              onTap: () {
                showRequestMediationDialogBox(context);
              },
              child: OptionContainer(
                title: 'Request Mediation',
              ),
            ),
            GestureDetector(
              onTap: () {
                showResolveContractDialogBox(context);
              },
              child: OptionContainer(
                title: 'Resolve Contract',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionContainer extends StatelessWidget {
  final String title;
  const OptionContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color(0xffFFF5F1),
        borderRadius: BorderRadius.circular(46.r),
      ),
      child: Text(title,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.kPrimaryColor,
          ))),
    );
  }
}
