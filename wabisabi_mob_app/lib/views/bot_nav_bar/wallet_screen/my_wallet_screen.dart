// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/my_Account_controller.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/widgets/transaction_tile.dart';
import 'package:wabisabi_mob_app/widgets/stats_graph.dart';

class MyWalletScreen extends GetView<MyAccountController> {
  static const routeName = 'MyWalletScreen';
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> timeFilters = [
      'Today',
      'Yesterday',
      'Last 7 days',
      'Last 30 days',
      'This month',
      'Last month',
      'Last 3 months',
      'Last 6 months',
      'This year',
      'Last year',
      'All time'
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 24.h),
        forceMaterialTransparency: true,
        title: const Text('My Wallet'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffFF7F50).withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 15,
                        offset: const Offset(2, 12),
                      ),
                    ],
                    gradient: const LinearGradient(colors: [
                      Color(0xffFF7F50),
                      Color(0xffFFDB58),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: k15BorderRadius,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                      // k1hSizedBox,
                      Text(
                        '\$524,410.00',
                        style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
              SizedBox(
                height: 24.h,
              ),
              // Weekly Stats with Clickable Dropdown Button
              Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      controller.selectedTimeFilter.value,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                    items: timeFilters
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      if (value != null) {
                        controller.updateSelectedFilter(value);
                      }
                    },
                    value: timeFilters
                            .contains(controller.selectedTimeFilter.value)
                        ? controller.selectedTimeFilter.value
                        : null,
                    buttonStyleData: ButtonStyleData(
                      height: 40.h,
                      width: 125.w,
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 300.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.find<ThemeController>().themeMode.value ==
                                ThemeMode.dark
                            ? AppColors.kDarkFieldFillColor
                            : Colors.white,
                      ),
                      offset: Offset(0, -5),
                      scrollbarTheme: ScrollbarThemeData(
                        thumbColor:
                            MaterialStateProperty.all(AppColors.kPrimaryColor),
                        radius: Radius.circular(8),
                        thickness: MaterialStateProperty.all(5),
                      ),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24.sp,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: StatsGraph(),
              ),
              SizedBox(
                height: 24.h,
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
                                color: AppColors.kPrimaryColor.withOpacity(0.6),
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
                            Text('Latest Transactions',
                                style: TextStyle(fontSize: 16.sp)),
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
            ],
          ),
        ),
      ),
    );
  }
}
