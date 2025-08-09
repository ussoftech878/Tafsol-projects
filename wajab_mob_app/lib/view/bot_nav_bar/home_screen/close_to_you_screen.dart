import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/widgets/product_container2.dart';

class CloseToYouScreen extends GetView<HomeScreenController> {
  static const routeName = 'CloseToYouScreen';
  const CloseToYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        // toolbarHeight: 128.h,
        // leadingWidth: 400.w,
        leadingWidth: 48.w,

        backgroundColor: AppColors.kPrimaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 27).w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              svgAssets.backArrow,
              color: AppColors.kScaffoldColor,
            ),
          ),
        ),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.kScaffoldColor,
            // color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 27.w,
              right: 27.w,
              top: 22.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Close to you',
                    style: TextStyle(
                        color: AppColors.forestColor,
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontSize: 18.7.sp)),
                SizedBox(
                  height: 18.h,
                ),
                Expanded(
                  child: ListView.builder(
                      // itemCount: 5,
                      itemBuilder: (context, index) {
                    return const ProductContainer2();
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
