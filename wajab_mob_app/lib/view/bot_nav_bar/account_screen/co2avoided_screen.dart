import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/widgets/co2avoided_tile.dart';

import '../../../widgets/custom_back_button_app_bar.dart';

class CO2AvoidedScreen extends GetView<AccountScreenController> {
  static const routeName = 'CO2AvoidedScreen';

  const CO2AvoidedScreen({super.key});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      // Update the selected date in the controller
      Get.find<HomeScreenController>().selectedDate.value =
          "${pickedDate.day}-${"Feburary".tr}-${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;
    final hasBottomNotch = bottomPadding > 0;
    return Scaffold(
      appBar: CustomBackButtonAppBar(title: 'CO2 avoided'.tr),
      body: Padding(
        padding: EdgeInsets.only(
                left: 27,
                right: 27,
                bottom: hasBottomNotch ? 100.h : 20,
                top: 46)
            .w,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 56.h,
                  // ),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: const Color(0xffE2E5E8)),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(svgAssets.calender),
                          SizedBox(width: 16.w),
                          Obx(() => Text(
                                Get.find<HomeScreenController>()
                                    .selectedDate
                                    .value,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xff868787),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Get.find<HomeScreenController>()
                                        .languagecontroller
                                        .fontFamily
                                        .value),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 47.h),
                  Text('This Month'.tr,
                      style: TextStyle(
                          color: const Color(0xff104D4D),
                          fontWeight: FontWeight.w600,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontSize: 20.sp)),
                  SizedBox(height: 20.h),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CO2AvoidedTile(
                          showDivider: index != 4 - 1,
                        );
                      }),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: const Color(0xffDEE8E7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      svgAssets.leaf,
                      width: 25.7.w,
                      // height: 28.8.h,
                    ),
                    SizedBox(
                      width: 18.63.w,
                    ),
                    Text(
                      'Total CO2 \navoided'.tr,
                      style: TextStyle(
                          height: 1.2,
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontSize: 14.sp),
                    ),
                    const Spacer(),
                    Text(
                      '150' + "kg".tr,
                      style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontSize: 26.5.sp),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
