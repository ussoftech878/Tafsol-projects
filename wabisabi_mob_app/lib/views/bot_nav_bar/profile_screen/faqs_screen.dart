import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/my_Account_controller.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';

class FAQsScreen extends GetView<MyAccountController> {
  static const routeName = 'FAQsScreen';
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frequently Asked Questions'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                expandedAlignment: Alignment.topLeft,
                showTrailingIcon: true,
                minTileHeight: 0,
                title: Text(
                  'What is Wabisabi?',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Get.find<ThemeController>().themeMode.value ==
                            ThemeMode.dark
                        ? AppColors.kWhiteColor
                        : const Color(0xff4F4F4F),
                  ),
                ),
                children: <Widget>[
                  Text(
                    'Lorem ipsum answer.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff868787),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xffE2E5E8),
            ),
            Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                expandedAlignment: Alignment.topLeft,
                showTrailingIcon: true,
                minTileHeight: 0,
                title: Text(
                  'How do the Transactions work?',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Get.find<ThemeController>().themeMode.value ==
                            ThemeMode.dark
                        ? AppColors.kWhiteColor
                        : const Color(0xff4F4F4F),
                  ),
                ),
                children: <Widget>[
                  Text(
                    'Lorem ipsum answer.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff868787),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xffE2E5E8),
            ),
            Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                expandedAlignment: Alignment.topLeft,
                showTrailingIcon: true,
                minTileHeight: 0,
                title: Text(
                  'Why are the Agreements',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Get.find<ThemeController>().themeMode.value ==
                            ThemeMode.dark
                        ? AppColors.kWhiteColor
                        : const Color(0xff4F4F4F),
                  ),
                ),
                children: <Widget>[
                  Text(
                    'Valid till December 12, 2024',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff868787),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
