import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/payment_methods/order_confirmation_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/widgets/card_container.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';

import '../../../../widgets/custom_back_button_app_bar.dart';

class CardSelectionScreen extends StatefulWidget {
  static const routeName = 'CardSelectionScreen';
  const CardSelectionScreen({super.key});

  @override
  State<CardSelectionScreen> createState() => _CardSelectionScreenState();
}

class _CardSelectionScreenState extends State<CardSelectionScreen> {
  int selectedIndex = -1; // Tracks the index of the selected card

  void handleSelection(int index) {
    setState(() {
      selectedIndex = index; // Update selection
    });
  }

  AccountScreenController controller = Get.put(AccountScreenController());
  @override
  Widget build(BuildContext context) {
    final textdirection = Directionality.of(context);
    return Scaffold(
      appBar: CustomBackButtonAppBar(
        title: 'My Cards'.tr,
        actionsButton: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: GestureDetector(
                onTap: () {
                  BottomSheetManager.editCardBottomSheet(context);
                },
                child: SvgPicture.asset(
                  svgAssets.editProfile,
                  width: 24.w,
                )),
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 27.w, right: 27.w, top: 27.h, bottom: 27.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardContainer(
              svg: SvgPicture.asset(svgAssets.visa),
              isSelected: selectedIndex == 0,
              onSelected: (isSelected) =>
                  handleSelection(0), // Update selection logic
            ),
            CardContainer(
              svg: SvgPicture.asset(svgAssets.master),
              isSelected: selectedIndex == 1,
              onSelected: (isSelected) =>
                  handleSelection(1), // Update selection logic
            ),
            GestureDetector(
              onTap: () {
                BottomSheetManager.addCardBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: textdirection == TextDirection.ltr
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        svgAssets.newcard,
                        width: 16.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text('Add new card'.tr,
                          style: TextStyle(
                              color: AppColors.forestColor,
                              fontSize: 12.sp,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(OrderConfirmationScreen.routeName);
                },
                child: Text('Pay Amount'.tr + ' - ' + 'BHD'.tr + ' 2.20 '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
