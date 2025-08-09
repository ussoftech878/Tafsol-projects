import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = 'NotificationScreen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 24.h),
        forceMaterialTransparency: true,
        title: const Text('Notifications'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Text(
              'Mark all as read',
              style: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return NotificationTile();
            }))
          ],
        ),
      ),
    );
  }
}
