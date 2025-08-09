import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/my_orders/your_order_cancel_screen.dart';

class MyOrderTile extends GetView<Languagecontroller> {
  final bool showDivider;
  const MyOrderTile({super.key, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);
    return InkWell(
      onTap: () {
        Get.toNamed(YourOrderCancelScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imageAssets.storeLogo,
                  width: 40.w,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joe & The Juice - The Walk',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: controller.fontFamily.value,
                            color: const Color(0xff4F4F4F),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            svgAssets.clock,
                            width: 16.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text('Pick up'.tr + ': ',
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.forestColor,
                                  fontFamily: controller.fontFamily.value,
                                  fontWeight: FontWeight.w600)),
                          Text(
                              'Today at'.tr +
                                  ' 2:00 ' +
                                  'AM'.tr +
                                  ' - 5:00 ' +
                                  'AM'.tr,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.forestColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: controller.fontFamily.value,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.forestColor)),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: 10.w,
                // ),
                textDirection == TextDirection.ltr
                    ? SvgPicture.asset(
                        svgAssets.noti_arrow,
                        height: 12.h,
                      )
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(
                            3.14), // Flip horizontally for RTL
                        child: SvgPicture.asset(
                          svgAssets.noti_arrow,
                          height: 12.h,
                        ),
                      ),
              ],
            ),
            if (showDivider)
              Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  const Divider(
                    color: Color(0xffE2E5E8),
                    thickness: 1.6,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
