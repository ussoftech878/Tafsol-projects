import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/browse_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/widgets/product_container2.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';

import '../../../widgets/custom_home_app_bar.dart';

class BrowseScreen extends GetView<BrowseScreenController> {
  static const routeName = 'BrowseScreen';
  const BrowseScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;

    final hasBottomNotch = bottomPadding > 0;

    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: const CustomHomeAppBar(showActionButtons: false, showLeadingButton: true,),
      body: Obx(() => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.kScaffoldColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            image: controller.isListView.value
                ? null
                : const DecorationImage(
                    image: AssetImage(imageAssets.map), fit: BoxFit.cover),
          ),
          child: controller.isListView.value
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 27.w,
                    right: 27.w,
                    top: 26.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 1.75.h),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search for food or stores',
                                prefixIcon: SvgPicture.asset(
                                  svgAssets.Search,
                                  fit: BoxFit.scaleDown,
                                  width: 24.w,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          InkWell(
                            onTap: () {
                              BottomSheetManager.filterBottomSheet(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 13.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: const Color(0xffE2E5E8))),
                              child: SvgPicture.asset(svgAssets.filter),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 42.h,
                      ),
                      InkWell(
                        onTap: () {
                          BottomSheetManager.sortingBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Text('Sorted by:',
                                style: TextStyle(
                                    color: const Color(0xff252525),
                                    fontSize: 14.sp,
                                    fontFamily: controller
                                        .languagecontroller.fontFamily.value,
                                    fontWeight: FontWeight.w500)),
                            Text(' Relevance',
                                style: TextStyle(
                                    color: AppColors.kPrimaryColor,
                                    fontSize: 14.sp,
                                    fontFamily: controller
                                        .languagecontroller.fontFamily.value,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                          return const ProductContainer2();
                        }),
                      ),
                      SizedBox(
                        height: hasBottomNotch?27.h:0,

                      )
                    ],
                  ),
                )
              : Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 27.w,
                        right: 27.w,
                        top: 26.h,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 1.75.h),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search for food or stores',
                                prefixIcon: SvgPicture.asset(
                                  svgAssets.Search,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          InkWell(
                            onTap: () {
                              BottomSheetManager.filterBottomSheet(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 13.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: const Color(0xffE2E5E8))),
                              child: SvgPicture.asset(svgAssets.filter),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      floatingActionButton: Obx(() => Padding(
        padding:  EdgeInsets.only(bottom: hasBottomNotch?48.h:5.h),
        child: SizedBox(
              height: 48.8.h,
              width: 116.w,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: controller.toggleView,
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(300.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.isListView.value
                          ? SvgPicture.asset(
                              svgAssets.mapVector,
                              width: 28.8,
                            )
                          : Image.asset(
                              imageAssets.menu,
                              width: 28.8,
                            ),
                      Text(
                        controller.isListView.value ? 'Map' : 'List',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.kScaffoldColor,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
