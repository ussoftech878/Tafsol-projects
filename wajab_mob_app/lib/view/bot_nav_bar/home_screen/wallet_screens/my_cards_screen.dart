import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/widgets/card_container.dart';
import 'package:wajba_mobile_app/widgets/show_dialog_box.dart';

class MyCardsScreen extends StatefulWidget {
  static const routeName = 'MyCardsScreen';
  const MyCardsScreen({super.key});

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  int selectedIndex = -1; // Tracks the index of the selected card

  void handleSelection(int index, bool isSelected) {
    setState(() {
      selectedIndex = isSelected ? index : -1; // Update selected card index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'My Cards',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        leadingWidth: 48.w,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 27).w,
            child: SvgPicture.asset(
              svgAssets.backArrow,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 27 , left:27, right:27 , top: 10).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardContainer(
              svg: SvgPicture.asset(
                svgAssets.visa,
                width: 46.w,
              ),
              isSelected: selectedIndex == 0,
              onSelected: (isSelected) => handleSelection(0, isSelected),
            ),
            // SizedBox(height: 16.h),
            CardContainer(
              svg: SvgPicture.asset(
                svgAssets.master,
                width: 46.w,
              ),
              isSelected: selectedIndex == 1,
              onSelected: (isSelected) => handleSelection(1, isSelected),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showPaymentFailedDialogBox(context);
                },
                child: Text(
                  'Pay BHD 1.00',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
