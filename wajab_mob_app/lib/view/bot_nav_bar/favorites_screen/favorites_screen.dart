import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/favourite_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/widgets/product_container2.dart';


class FavoritesScreen extends GetView<FavScreenController> {
  static const routeName = 'BrowseScreen';
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;

    final hasBottomNotch = bottomPadding > 0;
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar:  AppBar(
          toolbarHeight: 17.h,
            backgroundColor: AppColors.kPrimaryColor
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.kScaffoldColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 27.w, top: 26.h, right: 27.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My favorites',
                    style: TextStyle(
                        color: const Color(0xff104D4D),
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontSize: 20.sp)),
                SizedBox(
                  height: 18.h,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                    return const ProductContainer2(
                      isFavScreen: true,
                    );
                  }),
                ),
                SizedBox(
                  height: hasBottomNotch?27.h:0,

                )
              ],
            ),
          ),
        ));
  }
}
