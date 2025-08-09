import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/widgets/transaction_tile.dart';

import '../../../controllers/theme_controller.dart';

class TransactionHistoryScreen extends StatelessWidget {
  static const routeName = 'TransactionHistoryScreen';
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(size: 24.h),
          forceMaterialTransparency: true,
          centerTitle: false,
          title: const Text('Transaction History'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  style: TextStyle(fontSize: 16.sp),
                  decoration: InputDecoration(
                      hintText: 'Search by name or amount',
                      hintStyle:
                          TextStyle(color: Color(0xffCBC3C3), fontSize: 14.sp),
                      suffixIcon: SvgPicture.asset(
                        svgAssets.seacrh,
                        fit: BoxFit.scaleDown,
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Export transactions as CSV or PDF')),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ClipRRect(
                  borderRadius: k10BorderRadius,
                  child: Material(
                    elevation: 5,
                    color: Colors.transparent,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        height: 300.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Get.find<ThemeController>().themeMode.value ==
                                  ThemeMode.dark
                              ? Border.all(
                                  color:
                                      AppColors.kPrimaryColor.withOpacity(0.6),
                                  width: 1)
                              : null,
                          color: Get.find<ThemeController>().themeMode.value ==
                                  ThemeMode.dark
                              ? Colors.grey.shade500.withOpacity(0.2)
                              : Colors.white,
                          borderRadius: k10BorderRadius,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('14 November 2024',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  )),
                              Expanded(
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 20.h),
                                      itemCount: 20,
                                      itemBuilder: (context, index) {
                                        return const TransactionTile();
                                      }))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ClipRRect(
                  borderRadius: k10BorderRadius,
                  child: Material(
                    elevation: 5,
                    color: Colors.transparent,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        height: 450.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Get.find<ThemeController>().themeMode.value ==
                                  ThemeMode.dark
                              ? Border.all(
                                  color:
                                      AppColors.kPrimaryColor.withOpacity(0.6),
                                  width: 1)
                              : null,
                          color: Get.find<ThemeController>().themeMode.value ==
                                  ThemeMode.dark
                              ? Colors.grey.shade500.withOpacity(0.2)
                              : Colors.white,
                          borderRadius: k10BorderRadius,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('12 November 2024',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  )),
                              Expanded(
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 20.h),
                                      itemCount: 20,
                                      itemBuilder: (context, index) {
                                        return const TransactionTile();
                                      }))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ClipRRect(
                  borderRadius: k10BorderRadius,
                  child: Material(
                    elevation: 5,
                    color: Colors.transparent,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        height: 450.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Get.find<ThemeController>().themeMode.value ==
                                  ThemeMode.dark
                              ? Border.all(
                                  color:
                                      AppColors.kPrimaryColor.withOpacity(0.6),
                                  width: 1)
                              : null,
                          color: Get.find<ThemeController>().themeMode.value ==
                                  ThemeMode.dark
                              ? Colors.grey.shade500.withOpacity(0.2)
                              : AppColors.kWhiteColor,
                          borderRadius: k10BorderRadius,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Last Week',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  )),
                              Expanded(
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 2.h),
                                      itemCount: 20,
                                      itemBuilder: (context, index) {
                                        return const TransactionTile();
                                      }))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
