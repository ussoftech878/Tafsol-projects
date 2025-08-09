import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/close_to_you_screen.dart';
import 'package:wajba_mobile_app/widgets/category_list.dart';
import 'package:wajba_mobile_app/widgets/custom_home_app_bar.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';
import 'package:wajba_mobile_app/widgets/product_container.dart';

class HomeScreen extends GetView<HomeScreenController> {
  static const routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;
    final hasBottomNotch = bottomPadding > 0;
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: const CustomHomeAppBar(
        showActionButtons: true,
        showLeadingButton: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LanguageButton(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 27.w, left: 27.w, top: 26.h),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 15.5.h),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search for food or stores'.tr,
                    prefixIcon: SvgPicture.asset(
                      svgAssets.Search,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              SizedBox(
                height: 91.w,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 27.w, right: 27.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      List<Map<String, String>> categories = [
                        {
                          'svgAsset': svgAssets.category,
                          'categoryName': 'Meals'.tr
                        },
                        {
                          'svgAsset': svgAssets.bakery,
                          'categoryName': 'Bakery'.tr
                        },
                        {
                          'svgAsset': svgAssets.grocery,
                          'categoryName': 'Groceries'.tr
                        },
                        {'svgAsset': svgAssets.cafe, 'categoryName': 'Café'.tr},
                        {
                          'svgAsset': svgAssets.category,
                          'categoryName': 'Drinks'.tr
                        },
                        {
                          'svgAsset': svgAssets.category,
                          'categoryName': 'Desserts'.tr
                        },
                        // Add more categories here
                      ];
                      return CategoryList(
                        svgAsset: categories[index]['svgAsset']!,
                        title: categories[index]['categoryName']!,
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(right: 27.w, left: 27.w, top: 41.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Close to you'.tr,
                        style: TextStyle(
                            color: const Color(0xff104D4D),
                            fontWeight: FontWeight.w600,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                            fontSize: 20.sp)),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: const CloseToYouScreen(),
                                withNavBar: true);
                          },
                          child: Text(
                            'See All'.tr,
                            style: TextStyle(
                                color: const Color(0xff104D4D),
                                fontWeight: FontWeight.w600,
                                fontFamily: controller
                                    .languagecontroller.fontFamily.value,
                                fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 16.sp,
                          color: AppColors.forestColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                  height: 224.w,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 27.w, right: 27.w),
                      scrollDirection: Axis.horizontal,
                      // shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const ProductContainer();
                      })),
              SizedBox(
                height: 41.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 27.w, left: 27.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recommended for you'.tr,
                        style: TextStyle(
                            color: const Color(0xff104D4D),
                            fontWeight: FontWeight.w600,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                            fontSize: 20.sp)),
                    Row(
                      children: [
                        Text(
                          'See All'.tr,
                          style: TextStyle(
                              color: const Color(0xff104D4D),
                              fontWeight: FontWeight.w600,
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 16.sp,
                          color: AppColors.forestColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                  height: 224.w,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 27.w, right: 27.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const ProductContainer();
                      })),
              SizedBox(
                height: hasBottomNotch ? 100.h : 27.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
