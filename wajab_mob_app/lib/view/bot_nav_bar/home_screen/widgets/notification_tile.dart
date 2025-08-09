import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';

import '../../../../controllers/bot_nav_bar_controller.dart';

class NotificationTile extends StatelessWidget {
  final bool showDivider;

  const NotificationTile({super.key, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BotNavBarController controller = Get.find();
        controller.vissible.value = false;
        BottomSheetManager.notificationDetailBottomSheet(context)
            .whenComplete(() {
          controller.vissible.value = true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  svgAssets.notificationBadge,
                  width: 40.w,
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('12:23 PM - 11/03/2024',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff868787),
                          )),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        'Special announcement!',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text('Something great has been announced this year...',
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xff868787),
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 36.w,
                ),
                SvgPicture.asset(
                  svgAssets.noti_arrow,
                  height: 12.h,
                  width: 6.w,
                ),
              ],
            ),
            if (showDivider)
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(
                    color: Color(0xffE2E5E8),
                    thickness: 1.6,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
