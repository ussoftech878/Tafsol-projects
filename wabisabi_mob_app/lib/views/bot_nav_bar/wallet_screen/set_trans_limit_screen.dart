import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/my_Account_controller.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';

class SetTransLimitScreen extends GetView<MyAccountController> {
  static const routeName = 'SetTransLimitScreen';
  const SetTransLimitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 24.h),
        title: const Text('Set Transaction Limit'),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 24.w, top: 10.h, right: 24.w, bottom: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sending & Receiving Transactions',
                style: TextStyle(
                  fontSize: 17.sp,
                )),
            SizedBox(height: 15.h),

            // Daily Limit Container
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: Get.find<ThemeController>().themeMode.value ==
                        ThemeMode.dark
                    ? Colors.grey.shade500.withOpacity(0.2)
                    : const Color(0xffF5F9FE),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Get.find<ThemeController>().themeMode.value ==
                            ThemeMode.dark
                        ? Color(0x7FFF7F50)
                        : const Color(0xffB3B3B3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Limit',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  Obx(() => FlutterSlider(
                        values: [controller.dailyLimit.value],
                        max: 50,
                        min: 30,
                        trackBar: FlutterSliderTrackBar(
                          activeTrackBarHeight: 6,
                          inactiveTrackBarHeight: 6,
                          inactiveTrackBar: BoxDecoration(
                            color: const Color(0xffD3D3D3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          activeTrackBar: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        handler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: SvgPicture.asset(
                            svgAssets.handle,
                            height: 19.h,
                            width: 11.w,
                          ),
                        ),
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          controller.updateDailyLimit(lowerValue);
                        },
                      )),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '\$${controller.dailyLimit.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 14.sp,
                              )),
                          Text('\$500.00',
                              style: TextStyle(
                                fontSize: 14.sp,
                              )),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(height: 15.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: Get.find<ThemeController>().themeMode.value ==
                        ThemeMode.dark
                    ? Colors.grey.shade500.withOpacity(0.2)
                    : const Color(0xffF5F9FE),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xffB3B3B3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monthly Limit',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  Obx(() => FlutterSlider(
                        values: [controller.monthlyLimit.value],
                        max: 500,
                        min: 300,
                        trackBar: FlutterSliderTrackBar(
                          activeTrackBarHeight: 6,
                          inactiveTrackBarHeight: 6,
                          inactiveTrackBar: BoxDecoration(
                            color: const Color(0xffD3D3D3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          activeTrackBar: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        handler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: SvgPicture.asset(
                            svgAssets.handle,
                            height: 19.h,
                            width: 11.w,
                          ),
                        ),
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          controller.updateMonthlyLimit(lowerValue);
                        },
                      )),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '\$${controller.monthlyLimit.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 14.sp,
                              )),
                          Text('\$500.00',
                              style: TextStyle(
                                fontSize: 14.sp,
                              )),
                        ],
                      )),
                ],
              ),
            ),
            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Done')),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Get.find<ThemeController>().themeMode.value ==
                                      ThemeMode.dark
                                  ? Colors.grey.shade500.withOpacity(0.2)
                                  : Colors.transparent)),
                      onPressed: () {},
                      child: const Text('Cancel')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
