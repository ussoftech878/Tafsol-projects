import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/widgets/notification_tile.dart';

import '../../../widgets/custom_back_button_app_bar.dart';

class NotificationScreen extends GetView<HomeScreenController> {
  static const routeName = 'NotificationScreen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;
    final hasBottomNotch = bottomPadding > 0;
    return Scaffold(
      appBar:
      CustomBackButtonAppBar(title: 'Notifications'),
      body: Padding(
        padding: EdgeInsets.only(
          left: 27.w,
          right: 27.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search...',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.5.h),
                  prefixIcon: SvgPicture.asset(
                    svgAssets.Search,
                    fit: BoxFit.scaleDown,
                  ),
                  hintStyle:
                  TextStyle(fontSize: 14.sp,color: const Color(0xff868787))
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              Text(
                'Unread Notifications',
                style: TextStyle(
                  color: AppColors.forestColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: controller.languagecontroller.fontFamily.value,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero, // Remove any default padding
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NotificationTile(
                      showDivider: index != 2 - 1,
                    );
                  }),
              SizedBox(
                height: 35.h,
              ),
              Text(
                'Inbox',
                style: TextStyle(
                  color: AppColors.forestColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: controller.languagecontroller.fontFamily.value,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero, // Remove any default padding
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NotificationTile(
                      showDivider: index != 10 - 1,
                    );
                  }),
              SizedBox(
                height: hasBottomNotch?90.h:48.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
