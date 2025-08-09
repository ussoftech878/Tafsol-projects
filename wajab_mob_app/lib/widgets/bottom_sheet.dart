// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:wajba_mobile_app/controllers/bot_nav_bar_controller.dart';
import 'package:wajba_mobile_app/controllers/bottomsheet_controller.dart';
import 'package:wajba_mobile_app/controllers/cart_controller.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/auth_screens/reset_password.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/payment_methods/thankyou_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/support/support_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/terms_conditions/terms_conditions_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/vouchers/voucher_tile.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/widgets/past_order_tile.dart';
import 'package:wajba_mobile_app/widgets/checkbox.dart';
import 'package:wajba_mobile_app/widgets/custom_slider_button.dart';
import 'package:wajba_mobile_app/widgets/detail_container.dart';
import 'package:wajba_mobile_app/widgets/filter_container.dart';
import 'package:wajba_mobile_app/widgets/payment_method_tile.dart';
import 'package:wajba_mobile_app/widgets/show_dialog_box.dart';
import 'package:wajba_mobile_app/widgets/store_details_tile.dart';
import '../constants/assets.dart';
import '../constants/colors_constants.dart';
import '../constants/constants.dart';
import '../utils/arabic_formator.dart';

class BottomSheetManager {
  Languagecontroller controller = Get.put(Languagecontroller());

  // ignore: non_constant_identifier_names
  static Future<void> _CustomBottomSheet(
      BuildContext context, List<Widget> children) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, controller) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 27.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: children,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void storeDetailBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    CartController cartController = Get.put(CartController());
    bool isFavorite = false;
    BotNavBarController botNavBarController = Get.find();
    botNavBarController.vissible.value = false;

    _CustomBottomSheet(context, [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.745,
        child: Stack(
          // alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0,
              left: 150.w,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      Center(child: SvgPicture.asset(svgAssets.smallDivider))),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*SizedBox(
                    height: 25.h,
                  ),*/

                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        imageAssets.joe,
                        width: 65.w,
                        height: 65.h,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        svgAssets.download,
                        width: 40.w,
                        height: 40.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      StatefulBuilder(builder: (context, setState) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: AnimatedSwitcher(
                            duration: const Duration(
                                milliseconds:
                                    330), // Duration of the fade effect
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              // Fade transition
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: SvgPicture.asset(
                              isFavorite
                                  ? svgAssets.favFilled
                                  : svgAssets.favUnfilled,
                              width: 40.w,
                              height: 40.h,
                              key: ValueKey<bool>(
                                  isFavorite), // The key ensures a new widget for the transition
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Text('Pickup order from',
                      style: TextStyle(
                          color: const Color(0xff252525),
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          fontSize: 16.sp)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text('Joe & The Juice',
                      style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: controller.fontFamily.value,
                          fontSize: 24.sp)),
                  SizedBox(
                    height: 19.h,
                  ),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.w,
                    children: [
                      DetailContainer(
                        icon: SvgPicture.asset(
                          svgAssets.locationicon,
                          color: AppColors.forestColor,
                          width: 16.w,
                        ),
                        text: Text('The Walk, Riffa',
                            style: TextStyle(
                                fontFamily: controller.fontFamily.value,
                                fontWeight: FontWeight.w600,
                                color: AppColors.forestColor,
                                fontSize: 12.sp)),
                      ),
                      InkWell(
                        onTap: () {
                          final BotNavBarController bottomnavController =
                              Get.find();
                          bottomnavController.vissible.value = false;
                          BottomSheetManager.storeReviewBottomSheet(context);
                        },
                        child: DetailContainer(
                          icon: SvgPicture.asset(
                            svgAssets.staricon,
                            color: AppColors.forestColor,
                            width: 16.w,
                          ),
                          text: Text('4.9',
                              style: TextStyle(
                                  fontFamily: controller.fontFamily.value,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.forestColor,
                                  fontSize: 12.sp)),
                        ),
                      ),
                      DetailContainer(
                        icon: SvgPicture.asset(
                          svgAssets.clock,
                          color: AppColors.forestColor,
                          width: 16.w,
                        ),
                        text: Row(
                          children: [
                            Text('Earliest Pick Up: ',
                                style: TextStyle(
                                    fontFamily: controller.fontFamily.value,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.forestColor,
                                    fontSize: 12.sp)),
                            Text('Today at 1:00 AM - 2:00 AM',
                                style: TextStyle(
                                    fontFamily: controller.fontFamily.value,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.forestColor,
                                    fontSize: 12.sp,
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.asset(
                      imageAssets.map,
                      height: 140.h,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  const Divider(
                    color: Color(0xffE2E5E8),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Text('For pick up',
                      style: TextStyle(
                          color: AppColors.forestColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          fontSize: 20.sp)),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        svgAssets.clock,
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('Today 1:00 AM - 2:00 AM',
                          style: TextStyle(
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff4F4F4F),
                            fontSize: 16.sp,
                          )),
                    ],
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartController.itemsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 24).h,
                          child: StoreDetailsTile(
                            selectedIndex: index,
                          ),
                        );
                      }),
                  SizedBox(
                    height: 36.h,
                  ),
                  const Divider(
                    color: Color(0xffE2E5E8),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        svgAssets.clock,
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('Today 1:00 AM - 2:00 AM',
                          style: TextStyle(
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff4F4F4F),
                            fontSize: 16.sp,
                          )),
                    ],
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartController.itemsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 24.h),
                          child: StoreDetailsTile(
                            selectedIndex: index,
                          ),
                        );
                      }),
                  SizedBox(
                    height: 36.h,
                  ),
                  const Divider(
                    color: Color(0xffE2E5E8),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        svgAssets.clock,
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('Tomorrow 10:00 PM - 12:00 AM',
                          style: TextStyle(
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff4F4F4F),
                            fontSize: 16.sp,
                          )),
                    ],
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartController.itemsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 24.h),
                          child: StoreDetailsTile(
                            selectedIndex: index,
                          ),
                        );
                      }),
                  SizedBox(
                    height: 36.h,
                  ),
                  const Divider(
                    color: Color(0xffE2E5E8),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Text('Allergens',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff252525),
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value)),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                      'The bag may contain some sandwiches, teas, chocolates or coffee and ground beans.',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xff868787),
                          fontWeight: FontWeight.w500,
                          fontFamily: controller.fontFamily.value)),
                  SizedBox(
                    height: 28.h,
                  ),
                  const Divider(
                    color: Color(0xffE2E5E8),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Text('What you need to know',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff252525),
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value)),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                      'The bag may contain some sandwiches, teas, chocolates or coffee and ground beans.',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xff868787),
                          fontWeight: FontWeight.w500,
                          fontFamily: controller.fontFamily.value)),
                  SizedBox(
                    height: 28.h,
                  ),
                  const Divider(
                    color: Color(0xffE2E5E8),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Text('More info',
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: const Color(0xff252525),
                          fontWeight: FontWeight.w500,
                          fontFamily: controller.fontFamily.value)),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text('+973 1777 1777',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: controller.fontFamily.value)),
                  Text('www.joejuice.com',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: controller.fontFamily.value)),
                  SizedBox(
                    height: 58.h,
                  ),
                  const Divider(
                    color: Color(0xffE2E5E8),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 20.h, top: 12.h),
                color: AppColors.kScaffoldColor,
                child: ElevatedButton(
                    onPressed: () {
                      BottomSheetManager.checkoutItemsBottomSheet(context);
                    },
                    child: Text(
                      'Reserve 2 Items - BHD 3.98',
                      style: TextStyle(
                          fontFamily: controller.fontFamily.value,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ),
          ],
        ),
      ),
    ]).whenComplete(() {
      BotNavBarController controller = Get.find();
      controller.vissible.value = true;
    });
  }

  static void checkoutItemsBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    BotNavBarController botNavBarController = Get.find();
    botNavBarController.vissible.value = false;
    _CustomBottomSheet(context, [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.745,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(child: SvgPicture.asset(svgAssets.smallDivider))),
          SizedBox(
            height: 10.h,
          ),
          Center(
              child: Text(
            'Checkout Items',
            style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xff252525),
                fontFamily: controller.fontFamily.value,
                fontWeight: FontWeight.w600),
          )),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Store details',
                      style: TextStyle(
                          color: AppColors.forestColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          fontSize: 14.sp)),
                  Text('Joe & The Juice',
                      style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          fontSize: 24.sp)),
                ],
              ),
              const Spacer(),
              Image.asset(
                imageAssets.joe,
                height: 65.w,
                width: 65.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.w,
            children: [
              DetailContainer(
                icon: SvgPicture.asset(
                  svgAssets.locationicon,
                  color: AppColors.forestColor,
                  width: 16.w,
                ),
                text: Text('The Walk, Riffa',
                    style: TextStyle(
                        fontFamily: controller.fontFamily.value,
                        fontWeight: FontWeight.w600,
                        color: AppColors.forestColor,
                        fontSize: 12.sp)),
              ),
              DetailContainer(
                icon: SvgPicture.asset(
                  svgAssets.clock,
                  width: 16.w,
                ),
                text: Row(
                  children: [
                    Text('Pick Up: ',
                        style: TextStyle(
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: AppColors.forestColor,
                            fontSize: 12.sp)),
                    Text('Today at 1:00 AM - 2:00 AM',
                        style: TextStyle(
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: AppColors.forestColor,
                            fontSize: 12.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.forestColor)),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10).h,
            child: const Divider(
              color: Color(0xffE2E5E8),
            ),
          ),
          Row(
            children: [
              Text('Subtotal',
                  style: TextStyle(
                      color: const Color(0xff868787),
                      fontWeight: FontWeight.w500,
                      fontFamily: controller.fontFamily.value,
                      fontSize: 14.sp)),
              const Spacer(),
              Text('1.78',
                  style: TextStyle(
                      color: const Color(0xff868787),
                      fontWeight: FontWeight.w500,
                      fontFamily: controller.fontFamily.value,
                      fontSize: 14.sp)),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text('VAT(10%)',
                  style: TextStyle(
                      color: const Color(0xff868787),
                      fontWeight: FontWeight.w500,
                      fontFamily: controller.fontFamily.value,
                      fontSize: 14.sp)),
              const Spacer(),
              Text('0.21',
                  style: TextStyle(
                      color: const Color(0xff868787),
                      fontWeight: FontWeight.w500,
                      fontFamily: controller.fontFamily.value,
                      fontSize: 14.sp)),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text('Total',
                  style: TextStyle(
                      color: const Color(0xff252525),
                      fontWeight: FontWeight.w500,
                      fontFamily: controller.fontFamily.value,
                      fontSize: 14.sp)),
              const Spacer(),
              Text('BHD 1.99',
                  style: TextStyle(
                      color: const Color(0xff252525),
                      fontWeight: FontWeight.w500,
                      fontFamily: controller.fontFamily.value,
                      fontSize: 14.sp)),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(
            color: Color(0xffE2E5E8),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
            decoration: BoxDecoration(
                color: AppColors.kScaffoldColor,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  color: const Color(0xffE2E5E8),
                )),
            child: Row(
              children: [
                SvgPicture.asset(
                  svgAssets.ticket,
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text('Enter voucher',
                    style: TextStyle(
                        color: const Color(0xff868787),
                        fontWeight: FontWeight.w500,
                        fontFamily: controller.fontFamily.value,
                        fontSize: 14.sp)),
                const Spacer(),
                InkWell(
                  onTap: () {
                    BottomSheetManager.selectVoucherBottomSheet(context);
                  },
                  child: Text('Select',
                      style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: controller.fontFamily.value,
                          fontSize: 14.sp)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(svgAssets.emptywallet, width: 16.w),
              k1wSizedBox,
              InkWell(
                onTap: () {
                  BottomSheetManager.deductFromWalletBottomSheet(context);
                },
                child: Text('Deduct from wallet',
                    style: TextStyle(
                        color: AppColors.forestColor,
                        fontSize: 12.sp,
                        fontFamily: controller.fontFamily.value,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(TermsConditionsScreen.routeName);
            },
            child: RichText(
                text: TextSpan(
                    text:
                        'By choosing to reserve this meal and using the Wajba app, you agree to our ',
                    style: TextStyle(
                        color: const Color(0xff868787),
                        fontSize: 12.sp,
                        fontFamily: controller.fontFamily.value,
                        fontWeight: FontWeight.w500),
                    children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: 12.sp,
                        fontFamily: controller.fontFamily.value,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.kPrimaryColor),
                  )
                ])),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pay with',
                      style: TextStyle(
                          color: AppColors.kTextColor,
                          fontSize: 20.sp,
                          fontFamily: controller.fontFamily.value,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0.h),
                      child: SvgPicture.asset(
                        svgAssets.appleP,
                        width: 50.w,
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 16.h,
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                BottomSheetManager.paymentMethodsBottomSheet(context);
              },
              child: Text('Change payment method',
                  style: TextStyle(
                      color: AppColors.forestColor,
                      fontSize: 14.sp,
                      fontFamily: controller.fontFamily.value,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ]),
      ),
    ]);

    // .whenComplete(() {
    //   BotNavBarController controller = Get.find();
    //   controller.vissible.value = true;
    // });
  }

  static void storeReviewBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.27,
          // 75% of screen height
          minChildSize: 0.2,
          // Minimum height is 40% of the screen height
          maxChildSize: 1.0,
          // Maximum height can be 100% of the screen height
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 45.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Store Reviews',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          color: const Color(0xff252525)),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              svgAssets.foodQuality,
                              width: 40.w,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text('Food Quality',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.forestColor,
                                    fontFamily: controller.fontFamily.value,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 12.h,
                            ),
                            DetailContainer(
                              icon: SvgPicture.asset(svgAssets.staricon),
                              text: Text('4.9',
                                  style: TextStyle(
                                      fontFamily: controller.fontFamily.value,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.forestColor,
                                      fontSize: 12.sp)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              svgAssets.staffService,
                              width: 40.w,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text('Staff Service',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.forestColor,
                                    fontFamily: controller.fontFamily.value,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 12.h,
                            ),
                            DetailContainer(
                              icon: SvgPicture.asset(svgAssets.staricon),
                              text: Text('4.9',
                                  style: TextStyle(
                                      fontFamily: controller.fontFamily.value,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.forestColor,
                                      fontSize: 12.sp)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              svgAssets.overallValue,
                              width: 40.w,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text('Overall Value',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.forestColor,
                                    fontFamily: controller.fontFamily.value,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 12.h,
                            ),
                            DetailContainer(
                              icon: SvgPicture.asset(svgAssets.staricon),
                              text: Text('4.9',
                                  style: TextStyle(
                                      fontFamily: controller.fontFamily.value,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.forestColor,
                                      fontSize: 12.sp)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static void itemDetailsBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.25,
          // 75% of screen height
          // minChildSize: 0.2, // Minimum height is 40% of the screen height
          // maxChildSize: 1.0, // Maximum height can be 100% of the screen height
          expand: false,
          builder: (context, scrollController) {
            return Padding(
                padding: EdgeInsets.only(left: 24.w, right: 27.5.w, top: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Item Details',
                        style: TextStyle(
                            fontSize: 16.8.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: controller.fontFamily.value,
                            color: const Color(0xff252525)),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'What’s in “Sandwich Bag”?',
                      style: TextStyle(
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: controller.fontFamily.value,
                          color: const Color(0xff252525)),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'The bag may contain some sandwiches, teas, chocolates or coffee and ground beans.',
                      style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: controller.fontFamily.value,
                          color: const Color(0xff868787)),
                    ),
                    // SizedBox(
                    //   height: 56.h,
                    // ),
                  ],
                ));
          },
        );
      },
    );
  }

  static void selectVoucherBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    // BotNavBarController navBarController = Get.find();
    // navBarController.vissible.value = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.32,
          // 75% of screen height
          minChildSize: 0.2,
          // Minimum height is 40% of the screen height
          maxChildSize: 1.0,
          // Maximum height can be 100% of the screen height
          expand: false,
          builder: (context, scrollController) {
            return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 27.5.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                            child: SvgPicture.asset(svgAssets.smallDivider))),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text(
                        'Select Voucher',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: controller.fontFamily.value,
                            color: const Color(0xff252525)),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return VoucherTile(showDivider: index != 3 - 1);
                        }),
                  ],
                ));
          },
        );
      },
    );
    // .whenComplete(() {
    //   BotNavBarController controller = Get.find();
    //   controller.vissible.value = true;
    // });
  }

  static void loginBottomSheet(BuildContext context) {
    // Initialize the language controller
    Languagecontroller controller = Get.put(Languagecontroller());
    bool isPasswordVisible = false;

    // Determine the text direction based on the current language
    TextDirection textDirection = controller.language.value == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Directionality(
                textDirection:
                    textDirection, // Set the text direction dynamically
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 27.w, right: 27.w, top: 20.h, bottom: 27.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: textDirection == TextDirection.rtl
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: SvgPicture.asset(svgAssets.smallDivider),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: textDirection == TextDirection.rtl
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          'Welcome Back!'.tr,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.sp,
                                    fontFamily: controller.fontFamily.value,
                                  ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Align(
                        alignment: textDirection == TextDirection.rtl
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          'Sign into your account'.tr,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: const Color(0xff828484),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: controller.fontFamily.value,
                                  ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Align(
                        alignment: textDirection == TextDirection.rtl
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          'Email'.tr,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: AppColors.kTextGreyColor,
                                    fontFamily: controller.fontFamily.value,
                                  ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'someone@gmail.com'.tr,
                          hintStyle: TextStyle(
                            color: const Color(0xff868787),
                            fontWeight: FontWeight.w500,
                            fontSize: 15.5.sp,
                          ),
                          prefixIcon: SvgPicture.asset(
                            svgAssets.sms,
                            fit: BoxFit.scaleDown,
                            width: 24.w,
                          ),
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Align(
                        alignment: textDirection == TextDirection.rtl
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          'Password'.tr,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: AppColors.kTextGreyColor,
                                    fontFamily: controller.fontFamily.value,
                                  ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 15.5.h),
                          hintText: 'Password'.tr,
                          prefixIcon: SvgPicture.asset(
                            svgAssets.lock,
                            fit: BoxFit.scaleDown,
                            width: 24.w,
                          ),
                          suffixIcon: IconButton(
                            icon: isPasswordVisible
                                ? SvgPicture.asset(
                                    svgAssets.eye,
                                    width: 24.w,
                                  )
                                : SvgPicture.asset(
                                    svgAssets.eyeSlash,
                                    width: 24.w,
                                  ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Align(
                        alignment: textDirection == TextDirection.rtl
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(ResetPassword.routeName);
                          },
                          child: Text(
                            'Forgot Password?'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: AppColors.kPrimaryColor,
                                  fontSize: 14.sp,
                                  fontFamily: controller.fontFamily.value,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Login'.tr),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  static Future<void> notificationDetailBottomSheet(
      BuildContext context) async {
    Languagecontroller controller = Get.put(Languagecontroller());

    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        backgroundColor: AppColors.kScaffoldColor,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              // Control the height of the bottom sheet
              initialChildSize: 0.71,
              // 75% of screen height
              minChildSize: 0.4,
              // Minimum height is 40% of the screen height
              maxChildSize: 1.0,
              // Maximum height can be 100% of the screen height
              expand: false,
              builder: (context, scrollController) {
                return Padding(
                  padding:
                      EdgeInsets.only(left: 23.w, right: 23.w, bottom: 55.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          svgAssets.divider,
                          width: 135.w,
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Notification Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: controller.fontFamily.value,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff252525),
                            )),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'Special announcement!',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.kPrimaryColor,
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Exciting things are cooking at Wajba! We\'re thrilled to share that we\'re gearing up to launch a revolutionary app that helps you save delicious meals and reduce food waste—all while supporting local businesses. 🌍✨',
                        style: TextStyle(
                          height: 1.6,
                          fontSize: 13.sp,
                          fontFamily: controller.fontFamily.value,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff868787),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Here\'s what\'s in store for you:',
                        style: TextStyle(
                          height: 1.6,
                          fontSize: 13.sp,
                          fontFamily: controller.fontFamily.value,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff868787),
                        ),
                      ),
                      SizedBox(
                        height: 0.3.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            imageAssets.checkbox,
                            width: 13.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Affordable meals you\'ll love',
                            style: TextStyle(
                              height: 1.6,
                              fontSize: 13.sp,
                              fontFamily: controller.fontFamily.value,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff868787),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0.6.h),
                            child: Image.asset(
                              imageAssets.checkbox,
                              width: 13.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              'A chance to make a positive impact on the environment',
                              style: TextStyle(
                                height: 1.3,
                                fontSize: 14.4.sp,
                                fontFamily: controller.fontFamily.value,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff868787),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            imageAssets.checkbox,
                            width: 13.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Exclusive deals for our early supporters',
                            style: TextStyle(
                              height: 1.6,
                              fontSize: 13.sp,
                              fontFamily: controller.fontFamily.value,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff868787),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Stay tuned for our grand reveal! 🛎️ Follow us to get updates, sneak peeks, and exciting offers before anyone else. Let\'s make every bite count!',
                        style: TextStyle(
                          height: 1.6,
                          fontSize: 13.sp,
                          fontFamily: controller.fontFamily.value,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff868787),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            'Got it',
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }

  static Future<void> addFundsBottomSheet(BuildContext context) async {
    Languagecontroller controller = Get.put(Languagecontroller());
    BotNavBarController navBarController = Get.find();
    navBarController.vissible.value = false;

    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        backgroundColor: AppColors.kScaffoldColor,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              // Control the height of the bottom sheet
              initialChildSize: 0.46,
              // 75% of screen height
              minChildSize: 0.4,
              // Minimum height is 40% of the screen height
              maxChildSize: 1.0,
              // Maximum height can be 100% of the screen height
              expand: false,
              builder: (context, scrollController) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 27.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                              child: SvgPicture.asset(svgAssets.smallDivider))),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text('Add Funds',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff252525),
                          )),
                      SizedBox(
                        height: 32.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 34.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.6.w, vertical: 15.5.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffE2E5E8),
                                ),
                                borderRadius: BorderRadius.circular(11.r),
                              ),
                              child: Text(
                                'BHD 1.00',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: controller.fontFamily.value,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff868787)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.6.w, vertical: 15.5.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffE2E5E8),
                                ),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Text(
                                'BHD 3.00',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: controller.fontFamily.value,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff868787)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.6.w, vertical: 15.5.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffE2E5E8),
                                ),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Text(
                                'BHD 5.00',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: controller.fontFamily.value,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff868787)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const Divider(
                        color: Color(0xffE2E5E8),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text('Enter Custom Amount',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff4F4F4F),
                          )),
                      k2hSizedBox,
                      Text('1.00',
                          style: TextStyle(
                            fontSize: 42.sp,
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kPrimaryColor,
                          )),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pop(context);
                              BottomSheetManager.paymentMethodsBottomSheet(
                                  context);
                            },
                            child: const Text('Choose Payment Method')),
                      ),
                    ],
                  ),
                );
              });
        }).whenComplete(() {
      BotNavBarController navBarController = Get.find();
      navBarController.vissible.value = true;
    });
  }

  static void paymentMethodsBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    // BotNavBarController navBarController = Get.find();
    // navBarController.vissible.value = false;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        backgroundColor: AppColors.kScaffoldColor,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              // Control the height of the bottom sheet
              initialChildSize: 0.43,
              // 75% of screen height
              minChildSize: 0.4,
              // Minimum height is 40% of the screen height
              maxChildSize: 1.0,
              // Maximum height can be 100% of the screen height
              expand: false,
              builder: (context, scrollController) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 27.w, right: 27.w, bottom: 27.h, top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                              child: SvgPicture.asset(svgAssets.smallDivider))),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text('Select Payment Method',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff252525),
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      PaymentMethodTile(
                        svg: SvgPicture.asset(
                          svgAssets.dPay,
                          width: 46.w,
                        ),
                        title: 'Debit/Credit Card',
                      ),
                      PaymentMethodTile(
                        svg: SvgPicture.asset(
                          svgAssets.applePay,
                          width: 46.w,
                        ),
                        title: 'Apple Pay',
                      ),
                      PaymentMethodTile(
                        svg: SvgPicture.asset(
                          svgAssets.gPay,
                          width: 46.w,
                        ),
                        title: 'Google Pay',
                      ),
                      PaymentMethodTile(
                        svg: Image.asset(
                          imageAssets.bPay,
                          fit: BoxFit.scaleDown,
                          width: 46.w,
                        ),
                        title: 'BenefitPay',
                        showDivider: false,
                      )
                    ],
                  ),
                );
              });
        });

    //     .whenComplete(() {
    //   BotNavBarController controller = Get.find();
    //   controller.vissible.value = true;
    // });
  }

  static void deductFromWalletBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    BottomsheetController bottomsheetController =
        Get.put(BottomsheetController());
    final TextEditingController _controller =
        TextEditingController(text: '1.00');

    // BotNavBarController botNavBarController = Get.find();
    // botNavBarController.vissible.value = false;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        backgroundColor: AppColors.kScaffoldColor,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              // Control the height of the bottom sheet
              initialChildSize: 0.51,
              // 75% of screen height
              minChildSize: 0.4,
              // Minimum height is 40% of the screen height
              maxChildSize: 1.0,
              // Maximum height can be 100% of the screen height
              expand: false,
              builder: (context, scrollController) {
                return InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 27.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                  child: SvgPicture.asset(
                                      svgAssets.smallDivider))),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Pay With Wallet',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: controller.fontFamily.value,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff252525),
                              )),
                          SizedBox(
                            height: 32.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: const Color(0xffEBEBEB),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              'Balance: BHD 15.99',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: controller.fontFamily.value,
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: bottomsheetController.selectFullAmount,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.h, horizontal: 26.w),
                                    decoration: BoxDecoration(
                                      color: bottomsheetController
                                              .isFullAmountSelected.value
                                          ? AppColors.kPrimaryColor
                                          : AppColors.kScaffoldColor,
                                      border: Border.all(
                                          color: bottomsheetController
                                                  .isFullAmountSelected.value
                                              ? AppColors.kPrimaryColor
                                              : const Color(0xffE2E5E8)),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Full Amount',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              controller.fontFamily.value,
                                          color: bottomsheetController
                                                  .isFullAmountSelected.value
                                              ? const Color(0xffBDFFE1)
                                              : const Color(0xff868787),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                GestureDetector(
                                  onTap: bottomsheetController.selectCustom,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.h, horizontal: 26.w),
                                    decoration: BoxDecoration(
                                      color: !bottomsheetController
                                              .isFullAmountSelected.value
                                          ? AppColors.kPrimaryColor
                                          : AppColors.kScaffoldColor,
                                      border: Border.all(
                                          color: !bottomsheetController
                                                  .isFullAmountSelected.value
                                              ? AppColors.kPrimaryColor
                                              : const Color(0xffE2E5E8)),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Custom',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              controller.fontFamily.value,
                                          color: !bottomsheetController
                                                  .isFullAmountSelected.value
                                              ? const Color(0xffBDFFE1)
                                              : const Color(0xff868787),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: const Divider(
                              color: Color(0xffE2E5E8),
                            ),
                          ),
                          Obx(
                            () => Text(
                                bottomsheetController.isFullAmountSelected.value
                                    ? 'Amount Deducted'
                                    : 'Enter Custom Amount',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: controller.fontFamily.value,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff4F4F4F),
                                )),
                          ),
                          k2hSizedBox,
                          Obx(
                            () => bottomsheetController
                                    .isFullAmountSelected.value
                                ? Text('1.99',
                                    style: TextStyle(
                                      fontSize: 42.sp,
                                      fontFamily: controller.fontFamily.value,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.kPrimaryColor,
                                    ))
                                : SizedBox(
                                    width: 150.w,
                                    child: TextFormField(
                                        controller: _controller,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.done,
                                        textAlign: TextAlign.center,
                                        // Center the text
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                        style: TextStyle(
                                          fontSize: 42.sp,
                                          fontFamily:
                                              controller.fontFamily.value,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.kPrimaryColor,
                                        )),
                                  ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Deduct From Wallet')),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
    //     .whenComplete(() {
    //   BotNavBarController navBarController = Get.find();
    //   navBarController.vissible.value = true;
    // });
  }

  static void rateOrderBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        backgroundColor: AppColors.kScaffoldColor,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              // Control the height of the bottom sheet
              initialChildSize: 0.65,
              // 75% of screen height
              minChildSize: 0.4,
              // Minimum height is 40% of the screen height
              maxChildSize: 1.0,
              // Maximum height can be 100% of the screen height
              expand: false,
              builder: (context, scrollController) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 27.w, right: 27.w, top: 10.h, bottom: 39.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                              child: SvgPicture.asset(svgAssets.smallDivider))),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text('Rate your order from'.tr + '\nJoe & The Juice',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: controller.fontFamily.value,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff252525),
                          )),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'How was the food?'.tr,
                        style: TextStyle(
                            color: const Color(0xff868787),
                            fontFamily: controller.fontFamily.value,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RatingBar(
                        glow: false,
                        initialRating: 3,
                        itemSize: 30.h,
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

                      SizedBox(
                        height: 16.h,
                      ),
                      const Divider(
                        color: Color(0xffB3B3B3),
                        thickness: 0.7,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'How friendly were the staff?'.tr,
                        style: TextStyle(
                            color: const Color(0xff868787),
                            fontFamily: controller.fontFamily.value,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RatingBar(
                        glow: false,
                        initialRating: 3,
                        itemSize: 30.h,
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
                      SizedBox(
                        height: 16.h,
                      ),
                      const Divider(
                        color: Color(0xffB3B3B3),
                        thickness: 0.7,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'How was the value for money?'.tr,
                        style: TextStyle(
                            color: const Color(0xff868787),
                            fontFamily: controller.fontFamily.value,
                            fontSize: 16.5.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RatingBar(
                        glow: false,
                        initialRating: 3,
                        itemSize: 30.h,
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
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              showRatingDialogBox(context);
                            },
                            child: Text('Submit Review'.tr)),
                      ),
                      // SizedBox(
                      //   height: 64.h,
                      // ),
                    ],
                  ),
                );
              });
        });
  }

  static void addCardBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    bool isChecked = false; // Checkbox state

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        final TextDirection textDirection = Directionality.of(context);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.72,
              // 75% of screen height
              minChildSize: 0.4,
              // Minimum height is 40% of the screen height
              maxChildSize: 1.0,
              // Maximum height can be 100% of the screen height
              expand: false,
              builder: (context, scrollController) {
                return InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 27.w, right: 27.w, top: 30.h),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: SvgPicture.asset(svgAssets.divider)),
                            SizedBox(
                              height: 33.h,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: textDirection == TextDirection.ltr
                                          ? SvgPicture.asset(
                                              svgAssets.backArrow,
                                              fit: BoxFit.scaleDown,
                                            )
                                          : Transform(
                                              alignment: Alignment.center,
                                              transform: Matrix4.rotationY(
                                                  3.14), // Flip horizontally for RTL
                                              child: SvgPicture.asset(
                                                svgAssets.backArrow,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    'Add Card'.tr,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: controller.fontFamily.value,
                                      letterSpacing: 0.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 32.h,
                            ),
                            Text('Card number'.tr,
                                style: TextStyle(
                                    color: AppColors.kTextGreyColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: controller.fontFamily.value)),

                            SizedBox(
                              height: 10.h,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: const TextField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: '1234 1234 1234 1234',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text('Name on card'.tr,
                                style: TextStyle(
                                    color: AppColors.kTextGreyColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: controller.fontFamily.value)),
                            SizedBox(
                              height: 10.h,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'John Apple',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Expiry'.tr,
                                          style: TextStyle(
                                              color: AppColors.kTextGreyColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              fontFamily:
                                                  controller.fontFamily.value)),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: const TextField(
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            hintText: 'MM/YY',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('CVC/CVV',
                                          style: TextStyle(
                                              color: AppColors.kTextGreyColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              fontFamily:
                                                  controller.fontFamily.value)),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: const TextField(
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            hintText: '3 digits',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            // Custom Checkbox
                            Row(
                              children: [
                                CustomCheckbox(
                                  initialValue: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                  checkedColor: AppColors.kPrimaryColor,
                                  uncheckedColor: AppColors.kScaffoldColor,
                                ),
                                SizedBox(width: 8.w),
                                Text('Save card for later'.tr,
                                    style: TextStyle(
                                        color: AppColors.kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        fontFamily:
                                            controller.fontFamily.value)),
                              ],
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('Add Card'.tr)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  static void editCardBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    bool isChecked = false; // Checkbox state

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        TextDirection textDirection = Directionality.of(context);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.72,
              // 75% of screen height
              minChildSize: 0.4,
              // Minimum height is 40% of the screen height
              maxChildSize: 1.0,
              // Maximum height can be 100% of the screen height
              expand: false,
              builder: (context, scrollController) {
                return InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 27.w, right: 27.w, top: 25.h, bottom: 25.h),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: SvgPicture.asset(svgAssets.divider)),
                            SizedBox(
                              height: 38.h,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: textDirection == TextDirection.ltr
                                          ? SvgPicture.asset(
                                              svgAssets.backArrow,
                                              fit: BoxFit.scaleDown,
                                            )
                                          : Transform(
                                              alignment: Alignment.center,
                                              transform: Matrix4.rotationY(
                                                  3.14), // Flip horizontally for RTL
                                              child: SvgPicture.asset(
                                                svgAssets.backArrow,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          showDeleteCardDialogBox(context);
                                        },
                                        child: Text(
                                          'Delete'.tr,
                                          style: TextStyle(
                                            fontSize: 15.5.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily:
                                                controller.fontFamily.value,
                                            color: const Color(0xffF16055),
                                          ),
                                        ))
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    'Edit Card'.tr,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: controller.fontFamily.value,
                                      letterSpacing: 0.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 30.h,
                            ),
                            Text('Card number'.tr,
                                style: TextStyle(
                                    color: AppColors.kTextGreyColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: controller.fontFamily.value)),
                            SizedBox(
                              height: 10.h,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: const TextField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: '1234 1234 1234 1234',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text('Name on card'.tr,
                                style: TextStyle(
                                    color: AppColors.kTextGreyColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: controller.fontFamily.value)),
                            SizedBox(
                              height: 10.h,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'John Apple',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Expiry'.tr,
                                          style: TextStyle(
                                              color: AppColors.kTextGreyColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              fontFamily:
                                                  controller.fontFamily.value)),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: const TextField(
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            hintText: 'MM/YY',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('CVC/CVV',
                                          style: TextStyle(
                                              color: AppColors.kTextGreyColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              fontFamily:
                                                  controller.fontFamily.value)),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: const TextField(
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            hintText: '3 digits',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            // Custom Checkbox
                            Row(
                              children: [
                                CustomCheckbox(
                                  initialValue: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                  checkedColor: AppColors.kPrimaryColor,
                                  uncheckedColor: AppColors.kScaffoldColor,
                                ),
                                SizedBox(width: 8.w),
                                Text('Save card for later'.tr,
                                    style: TextStyle(
                                        color: AppColors.kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        fontFamily:
                                            controller.fontFamily.value)),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('Edit Card'.tr)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  static void myOrdersBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.49,
          // 75% of screen height
          minChildSize: 0.4,
          // Minimum height is 40% of the screen height
          maxChildSize: 1.0,
          // Maximum height can be 100% of the screen height
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: EdgeInsets.only(
                  left: 27.w, right: 27.w, top: 10.h, bottom: 27.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: SvgPicture.asset(svgAssets.smallDivider))),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'My Orders'.tr,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          // letterSpacing: 0.5,
                          color: const Color(0xff252525)),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return PastOrderTile(showDivider: index != 3 - 1);
                          }))
                ],
              ),
            );
          },
        );
      },
    );
  }

  static void filterBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    SfRangeValues updatedValues = const SfRangeValues(5, 10);
    BotNavBarController navBarController = Get.find();
    navBarController.vissible.value = false;
    RxBool isSelected = false.obs;
    RxBool isSelected2 = false.obs;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.73,
          // 75% of screen height
          minChildSize: 0.4,
          // Minimum height is 40% of the screen height
          maxChildSize: 0.8,
          // Maximum height can be 100% of the screen height
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: EdgeInsets.only(
                  left: 27.w, right: 27.w, top: 10.h, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: SvgPicture.asset(svgAssets.smallDivider))),
                  SizedBox(
                    height: 10.h,
                  ),

                  Center(
                    child: Text(
                      'Filter Options',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          color: const Color(0xff252525)),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Pick-up day',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: controller.fontFamily.value,
                        color: AppColors.forestColor),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Obx(() => GestureDetector(
                                onTap: () {
                                  // Toggle selection state
                                  isSelected.value = !isSelected.value;
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.5.h, horizontal: 12.w),
                                  decoration: BoxDecoration(
                                    color: isSelected.value
                                        ? AppColors
                                            .kPrimaryColor // Green color when selected
                                        : AppColors
                                            .kScaffoldColor, // Default color
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                        color: isSelected.value
                                            ? AppColors.kPrimaryColor
                                            : const Color(0xffE2E5E8)),
                                  ),
                                  child: Text(
                                    'Today',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.3.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: controller.fontFamily.value,
                                      color: isSelected.value
                                          ? AppColors
                                              .kScaffoldColor // White text when selected
                                          : const Color(
                                              0xff868787), // Default text color
                                    ),
                                  ),
                                ),
                              ))),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                          child: Obx(() => GestureDetector(
                                onTap: () {
                                  // Toggle selection state
                                  isSelected2.value = !isSelected2.value;
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.5.h, horizontal: 12.w),
                                  decoration: BoxDecoration(
                                    color: isSelected2.value
                                        ? AppColors
                                            .kPrimaryColor // Green color when selected
                                        : AppColors
                                            .kScaffoldColor, // Default color
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                        color: isSelected2.value
                                            ? AppColors.kPrimaryColor
                                            : const Color(0xffE2E5E8)),
                                  ),
                                  child: Text(
                                    'Tomorrow',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.3.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: controller.fontFamily.value,
                                      color: isSelected2.value
                                          ? AppColors
                                              .kScaffoldColor // White text when selected
                                          : const Color(
                                              0xff868787), // Default text color
                                    ),
                                  ),
                                ),
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Text(
                    'Pick-up time',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: controller.fontFamily.value,
                        color: AppColors.forestColor),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),

                  //  k2hSizedBox,
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${(updatedValues.start).toInt()}:00 PM - ${(updatedValues.end).toInt()}:00 PM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: controller.fontFamily.value,
                                  color: const Color(0xff868787))),
                          SfRangeSlider(
                            min: 1.0,
                            max: 24.0,
                            values: updatedValues,
                            interval: 1,
                            minorTicksPerInterval: 1,
                            activeColor: AppColors.forestColor,
                            inactiveColor: const Color(0xffE2E5E8),
                            onChanged: (SfRangeValues values) {
                              setState(() {
                                updatedValues = values;
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  k2hSizedBox,
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: controller.fontFamily.value,
                        color: AppColors.forestColor),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterContainer(title: 'Meals'),
                      FilterContainer(title: 'Bakery'),
                      FilterContainer(title: 'Coffee'),
                      FilterContainer(title: 'Vegetarian'),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      const FilterContainer(title: 'Vegan'),
                      k3wSizedBox,
                      const FilterContainer(title: 'Groceries'),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Apply Filters')),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Clear Filters',
                      style: TextStyle(
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          color: AppColors.kPrimaryColor),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      BotNavBarController controller = Get.find();
      controller.vissible.value = true;
    });
  }

  static void sortingBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());
    List<bool> isFilledList = [false, false, false, false];
    BotNavBarController navBarController = Get.find();
    navBarController.vissible.value = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.438,
          // 75% of screen height
          minChildSize: 0.2,
          // Minimum height is 40% of the screen height
          maxChildSize: 1.0,
          // Maximum height can be 100% of the screen height
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: EdgeInsets.only(
                  left: 27.w, right: 27.w, top: 20.h, bottom: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: SvgPicture.asset(svgAssets.smallDivider))),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'Sort By',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          color: const Color(0xff252525)),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  StatefulBuilder(builder: (context, setState) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFilledList[0] = !isFilledList[0];
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                'Relevance',
                                style: TextStyle(
                                    fontFamily: controller.fontFamily.value,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isFilledList[0]
                                        ? AppColors.kPrimaryColor
                                        : const Color(0xff4F4F4F)),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                isFilledList[0]
                                    ? svgAssets.fillSort
                                    : svgAssets.unfillSort,
                                width: 24.w,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFilledList[1] = !isFilledList[1];
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                    fontFamily: controller.fontFamily.value,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isFilledList[1]
                                        ? AppColors.kPrimaryColor
                                        : const Color(0xff4F4F4F)),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                isFilledList[1]
                                    ? svgAssets.fillSort
                                    : svgAssets.unfillSort,
                                width: 24.w,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFilledList[2] = !isFilledList[2];
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                'Rating',
                                style: TextStyle(
                                    fontFamily: controller.fontFamily.value,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isFilledList[2]
                                        ? AppColors.kPrimaryColor
                                        : const Color(0xff4F4F4F)),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                isFilledList[2]
                                    ? svgAssets.fillSort
                                    : svgAssets.unfillSort,
                                width: 24.w,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFilledList[3] = !isFilledList[3];
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                'Distance',
                                style: TextStyle(
                                    fontFamily: controller.fontFamily.value,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isFilledList[3]
                                        ? AppColors.kPrimaryColor
                                        : const Color(0xff4F4F4F)),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                isFilledList[3]
                                    ? svgAssets.fillSort
                                    : svgAssets.unfillSort,
                                width: 24.w,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                  SizedBox(
                    height: 32.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Sort Results')),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      BotNavBarController controller = Get.find();
      controller.vissible.value = true;
    });
  }

  static void troubleWithOrderBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.27,
          // 75% of screen height
          minChildSize: 0.2,
          // Minimum height is 40% of the screen height
          maxChildSize: 1.0,
          // Maximum height can be 100% of the screen height
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: EdgeInsets.only(
                left: 27.w,
                right: 27.w,
                top: 19.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: SvgPicture.asset(svgAssets.smallDivider))),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'What would you like to do?'.tr,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          color: const Color(0xff252525)),
                    ),
                  ),
                  SizedBox(
                    height: 66.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        showCancelOrderDialogBox(context);
                      },
                      child: Text(
                        'Cancel reservation'.tr,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: controller.fontFamily.value,
                            color: const Color(0xffF16055)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Divider(
                    color: Color(0xffB3B3B3),
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(SupportScreen.routeName);
                      },
                      child: Text(
                        'Contact Support'.tr,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: controller.fontFamily.value,
                            color: const Color(0xff252525)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static void collectOrderBottomSheet(BuildContext context) {
    Languagecontroller controller = Get.put(Languagecontroller());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      backgroundColor: AppColors.kScaffoldColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.345,
          // 75% of screen height
          minChildSize: 0.2,
          // Minimum height is 40% of the screen height
          maxChildSize: 1.0,
          // Maximum height can be 100% of the screen height
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: EdgeInsets.only(left: 27.w, right: 27.w, top: 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: SvgPicture.asset(svgAssets.smallDivider))),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'Collect Order'.tr,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: controller.fontFamily.value,
                          color: const Color(0xff252525)),
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Ready to collect? Just share the order ID with the staff to proceed.'
                            .tr,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: controller.fontFamily.value,
                            color: const Color(0xffB3B3B3)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: const Color(0xffDEE8E7),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        '#XQZF',
                        style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: controller.fontFamily.value,
                            color: AppColors.forestColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(ThankyouScreen.routeName);
                      },
                      child: const MySliderButton())
                ],
              ),
            );
          },
        );
      },
    );
  }
}
