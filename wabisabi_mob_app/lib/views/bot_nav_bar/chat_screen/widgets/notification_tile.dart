import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    svgAssets.avatar,
                    width: 53.w,
                    height: 53.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Darrell Steward',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Amet minim mollit non deserunt ulla...',
                      style: TextStyle(
                        fontSize: 11.sp,
                      )),
                  SizedBox(
                    height: 7.h,
                  ),
                  const Divider(
                    color: Color(0xffE8E8E8),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: 8.w,
            // ),
            Expanded(
              flex: 1,
              child: Text('01:01',
                  style: TextStyle(
                    fontSize: 11.sp,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 7.h,
        ),
      ],
    );
  }
}
