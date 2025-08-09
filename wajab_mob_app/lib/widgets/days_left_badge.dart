import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../constants/colors_constants.dart';
import '../controllers/home_screen_controller.dart';

class DaysLeftBadge extends GetView<HomeScreenController> {
  const DaysLeftBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
      decoration: BoxDecoration(
        color: const Color(0xffBDFFE1),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Text('5 Left',
          style: TextStyle(
            color: AppColors.kPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
            fontFamily: controller.languagecontroller.fontFamily.value,
          )),
    );
  }
}
