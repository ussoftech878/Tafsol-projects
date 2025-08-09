import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/widgets/my_order_tile.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/widgets/past_order_tile.dart';

import '../../../../widgets/custom_back_button_app_bar.dart';

class MyOrdersScreen extends GetView<AccountScreenController> {
  static const routeName = 'MyOrdersScreen';
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(title: 'My Orders'.tr),
      body: Padding(
        padding:
            EdgeInsets.only(left: 27.w, right: 27.w, top: 55.h, bottom: 27.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Active orders'.tr,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600,
                    color: AppColors.forestColor),
              ),
              SizedBox(
                height: 24.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MyOrderTile(showDivider: index != 2 - 1);
                  }),
              Text(
                'Past Orders'.tr,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w600,
                    color: AppColors.forestColor),
              ),
              SizedBox(
                height: 24.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PastOrderTile(showDivider: index != 3 - 1);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
