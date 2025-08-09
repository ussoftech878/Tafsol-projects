import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';

class AgreementCreationSteps extends StatelessWidget {
  final int step;
  const AgreementCreationSteps({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                  decoration: BoxDecoration(
                      color: step == 1 || step == 2 || step == 3
                          ? AppColors.kPrimaryColor
                          : Colors.grey,
                      shape: BoxShape.circle),
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 10.sp, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Text(
                    'Participants & Description',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: step == 1 || step == 2 || step == 3
                            ? AppColors.kPrimaryColor
                            : Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            width: 20.w,
            child: Divider(
              color: step == 1 || step == 2 || step == 3
                  ? AppColors.kPrimaryColor
                  : Colors.grey,
              thickness: 1,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                  decoration: BoxDecoration(
                      color: step == 2 || step == 3
                          ? AppColors.kPrimaryColor
                          : Colors.grey,
                      shape: BoxShape.circle),
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 10.sp, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Template',
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: step == 2 || step == 3
                          ? AppColors.kPrimaryColor
                          : Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Divider(
              color: step == 2 || step == 3
                  ? AppColors.kPrimaryColor
                  : Colors.grey,
              thickness: 1,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                  decoration: BoxDecoration(
                      color: step == 3 ? AppColors.kPrimaryColor : Colors.grey,
                      shape: BoxShape.circle),
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 10.sp, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Text(
                    'Agreement Creation',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color:
                            step == 3 ? AppColors.kPrimaryColor : Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
