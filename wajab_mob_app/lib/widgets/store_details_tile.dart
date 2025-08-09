import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/cart_controller.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/widgets/bottom_sheet.dart';

// ignore: must_be_immutable
class StoreDetailsTile extends GetView<Languagecontroller> {
  final int selectedIndex;

  StoreDetailsTile({super.key, required this.selectedIndex});

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // Local state for count
    // final RxInt count = 0.obs;

    return Container(
      margin: EdgeInsets.only(bottom: 3.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)).r,
            child: Image.asset(
              imageAssets.pastry,
              height: 65.w,
              width: 65.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          InkWell(
            onTap: () {
              BottomSheetManager.itemDetailsBottomSheet(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cartController.itemsList[selectedIndex].name,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xff252525),
                        fontWeight: FontWeight.w600,
                        fontFamily: controller.fontFamily.value)),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(cartController.itemsList[selectedIndex].price,
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: controller.fontFamily.value)),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                        cartController.itemsList[selectedIndex].discountedPrice,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xffB3B3B3),
                            fontWeight: FontWeight.w600,
                            fontFamily: controller.fontFamily.value,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: const Color(0xffB3B3B3))),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Obx(() {
            // Display SVG or increment/decrement container based on count
            // ignore: unrelated_type_equality_checks
            return cartController.itemsList[selectedIndex].count == 0
                ? InkWell(
                    onTap: () {
                      cartController.increment(itemIndex: selectedIndex);
                    },
                    child: SvgPicture.asset(
                      svgAssets.plus,
                      // height: 26.h,
                      width: 26.h,
                    ),
                  )
                : Container(
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(
                    (100)
                ),
                color: AppColors.kPrimaryColor
                    .withOpacity(0.1),
              ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            if (cartController
                                    .itemsList[selectedIndex].count.value ==
                                1) {
                              cartController.itemsList[selectedIndex].count
                                  .value = 0; // Reset to SVG plus icon
                            } else {
                              cartController
                                  .itemsList[selectedIndex].count.value--;
                            }
                          },
                          child: cartController
                                      .itemsList[selectedIndex].count.value ==
                                  1
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11.w, vertical: 6.h),

                                  child: SvgPicture.asset(
                                    svgAssets.bin2,
                                    width: 18.w,
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 13.w, vertical: 15.h),
                                  child: SvgPicture.asset(
                                    svgAssets.minus,
                                    width: 9.5.w,
                                  ),
                                )
                          //           1
                          // Icon(
                          //   cartController.itemsList[selectedIndex].count
                          //               .value ==
                          //           1
                          //       ? Icons.delete_outline
                          //       : Icons.remove,
                          //   color: AppColors.kPrimaryColor,
                          //   size: 3.h,
                          // ),
                          ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0.w,vertical: 4.h),
                        child: Text(
                          cartController.itemsList[selectedIndex].count.value
                              .toString(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kPrimaryColor),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            cartController.increment(
                                itemIndex: selectedIndex);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 11.h),
                            child: SvgPicture.asset(
                              svgAssets.plus2,
                            ),
                          )),
                    ],
                  ),
                );
          }),
        ],
      ),
    );
  }
}
