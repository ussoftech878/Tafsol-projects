import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/my_orders/order_details_screen.dart';

import '../../../../constants/colors_constants.dart';

class PastOrderTile extends GetView<Languagecontroller> {
  final bool showDivider;

  const PastOrderTile({super.key, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    final textdirection = Directionality.of(context);
    return InkWell(
      onTap: () {
        Get.toNamed(OrderDetailsScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imageAssets.storeLogo2,
                  width: 40.w,
                ),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Foundry - Manama',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: controller.fontFamily.value,
                            color: const Color(0xff4F4F4F),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text('11/03/2024',
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: controller.fontFamily.value,
                              color: const Color(0xff868787),
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5.w,
                      ),
                      AbsorbPointer(
                        child: RatingBar(
                          initialRating: 3,
                          itemSize: 15.h,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                          ratingWidget: RatingWidget(
                              full: const Icon(
                                Icons.star_rounded,
                                color: AppColors.forestColor,
                              ),
                              half: const Icon(
                                Icons.star_half_rounded,
                                color: AppColors.forestColor,
                              ),
                              empty: const Icon(
                                Icons.star_outline_rounded,
                                color: AppColors.forestColor,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                textdirection == TextDirection.ltr
                    ? SvgPicture.asset(
                        svgAssets.noti_arrow,
                        width: 6.h,
                        height: 12.h,
                      )
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(
                            3.14), // Flip horizontally for RTL
                        child: SvgPicture.asset(
                          svgAssets.noti_arrow,
                          width: 6.h,
                          height: 12.h,
                        ),
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
