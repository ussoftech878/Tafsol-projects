import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/constants/constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/widgets/money_saved_tile.dart';

import '../../../widgets/custom_back_button_app_bar.dart';

class MoneySavedScreen extends GetView<AccountScreenController> {
  static const routeName = 'MoneySavedScreen';
  const MoneySavedScreen({super.key});

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
          "${pickedDate.day}-${"Feburary"}-${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;
    final hasBottomNotch = bottomPadding > 0;
    return Scaffold(
      appBar: CustomBackButtonAppBar(title: 'Money saved'.tr),
      body: Padding(
        padding: EdgeInsets.only(
            left: 27.w,
            right: 27.w,
            bottom: hasBottomNotch ? 100.h : 20.h,
            top: 49.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
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
                          Get.find<HomeScreenController>().selectedDate.value,
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
            SizedBox(height: 44.h),
            Text('This Month'.tr,
                style: TextStyle(
                    color: const Color(0xff104D4D),
                    fontWeight: FontWeight.w600,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontSize: 18.5.sp)),
            SizedBox(height: 27.h),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  List<Map<String, String>> category = [
                    {
                      'svgAsset': svgAssets.bagsOrder,
                      'title': 'Bags Ordered'.tr,
                      'value': '0',
                    },
                    {
                      'svgAsset': svgAssets.originalValue,
                      'title': 'Original Value'.tr,
                      'value': '0',
                    },
                    {
                      'svgAsset': svgAssets.youPaid,
                      'title': 'You Paid'.tr,
                      'value': '0',
                    }
                  ];
                  return MoneySavedTile(
                      svg: SvgPicture.asset(category[index]['svgAsset']!),
                      title: category[index]['title']!,
                      value: category[index]['value']!);
                }),
            const Divider(
              color: Color(0xffE2E5E8),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Text('Money saved'.tr,
                    style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontSize: 15.sp)),
                const Spacer(),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('BHD'.tr,
                          style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 15.sp)),
                      k1wSizedBox,
                      Text('15.00',
                          style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 21.sp)),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.only(
                  left: 16.w, top: 16.h, bottom: 16.h, right: 19.w),
              decoration: BoxDecoration(
                color: const Color(0xffDEE8E7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    svgAssets.coin2,
                    width: 38.68.w,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    'Total money \nsaved'.tr,
                    style: TextStyle(
                        height: 1.2,
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontSize: 14.sp),
                  ),
                  const Spacer(),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        Text(
                          'BHD '.tr,
                          style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 11.sp),
                        ),
                        Text(
                          '150.00',
                          style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 26.5.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
