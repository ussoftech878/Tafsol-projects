import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';

class DetailContainer extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  final String des1;
  final String des2;
  final String des3;

  const DetailContainer(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.des1,
      required this.des2,
      required this.des3});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color(0xffF5F9FE),
        borderRadius: k15BorderRadius,
        border: Border.all(color: Color(0xffB3B3B3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title1,
                style: TextStyle(color: AppColors.kBlackText, fontSize: 14.sp),
              ),
              Text(
                des1,
                style: TextStyle(color: AppColors.kBlackText, fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title2,
                style: TextStyle(color: AppColors.kBlackText, fontSize: 14.sp),
              ),
              Text(
                des2,
                style: TextStyle(color: AppColors.kBlackText, fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title3,
                style: TextStyle(color: AppColors.kBlackText, fontSize: 14.sp),
              ),
              Text(
                des3,
                style: TextStyle(color: AppColors.kBlackText, fontSize: 14.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
