import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/vouchers/voucher_tile.dart';

import '../../../../widgets/custom_back_button_app_bar.dart';

class VouchersScreen extends GetView<AccountScreenController> {
  static const routeName = 'VouchersScreen';
  const VouchersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;
    final hasBottomNotch = bottomPadding > 0;
    return Scaffold(
      appBar: CustomBackButtonAppBar(title: 'Vouchers'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 41.h,
            ),
            Text(
              'Available Vouchers'.tr,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  fontWeight: FontWeight.w600,
                  color: AppColors.forestColor),
            ),
            SizedBox(
              height: 22.h,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return VoucherTile(showDivider: index != 3 - 1);
                    })),
            SizedBox(
              height: hasBottomNotch ? 50.h : 0.h,
            ),
          ],
        ),
      ),
    );
  }
}
