// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/constants/constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/view/auth_screens/login_with_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/FAQs/FAQs_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/account_details/account_detail_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/co2avoided_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/money_saved_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/my_orders/my_orders_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/payment_methods/card_Selection_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/support/support_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/terms_conditions/terms_conditions_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/vouchers/vouchers_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/widgets/account_container.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/widgets/account_tile.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

// ignore: must_be_immutable
class AccountScreen extends GetView<AccountScreenController> {
  static const routeName = 'AccountScreen';
  AccountScreen({super.key});

  AccountScreenController controller = Get.put(AccountScreenController());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;

    final hasBottomNotch = bottomPadding > 0;
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          toolbarHeight: 95.h,
          leadingWidth: 400,
          backgroundColor: AppColors.kPrimaryColor,
          leading: Padding(
            padding: EdgeInsets.only(right: 26.w, left: 27.w, top: 6.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  svgAssets.star,
                  width: 36.w,
                ),
                SizedBox(
                  width: 8.8.w,
                ),
                Text('Sara Ahmed',
                    style: TextStyle(
                        color: AppColors.kScaffoldColor,
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp)),
              ],
            ),
          ),
          actions: [
            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 26.5.w, vertical: 9.h),
                child: GestureDetector(
                    onTap: () {
                      controller.languagecontroller.toggleLanguage();
                    },
                    child: SvgPicture.asset(
                      svgAssets.global_light,
                      width: 24.w,
                    ))),
            SizedBox(
              width: 5.w,
            )
          ],
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
            padding: EdgeInsets.only(right: 27.w, left: 27.w, top: 26.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  k3hSizedBox,
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: const CO2AvoidedScreen(),
                                withNavBar: true);
                          },
                          child: AccountCard(
                              svg: SvgPicture.asset(
                                svgAssets.leaf,
                                width: 32.w,
                              ),
                              title: 'CO2 avoided'.tr,
                              value: '50',
                              unit: 'kg'.tr),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: const MoneySavedScreen(),
                                withNavBar: true);
                          },
                          child: AccountCard(
                              svg: SvgPicture.asset(
                                svgAssets.coin,
                                width: 40.w,
                              ),
                              title: 'Money saved'.tr,
                              value: '150',
                              unit: 'BHD'.tr),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text('Manage Account'.tr,
                      style: TextStyle(
                          color: const Color(0xff104D4D),
                          fontWeight: FontWeight.w600,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontSize: 20.sp)),
                  SizedBox(
                    height: 32.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AccountDetailScreen.routeName);
                    },
                    child: AccountTile(
                        svg: SvgPicture.asset(
                          svgAssets.accountDetails,
                          width: 34.w,
                        ),
                        title: 'Account details'.tr),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(MyOrdersScreen.routeName);
                    },
                    child: AccountTile(
                        svg: SvgPicture.asset(
                          svgAssets.myOrders,
                          width: 34.w,
                        ),
                        title: 'My Orders'.tr),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(CardSelectionScreen.routeName);
                    },
                    child: AccountTile(
                        svg: SvgPicture.asset(
                          svgAssets.paymentMethods,
                          width: 34.w,
                        ),
                        title: 'Payment methods'.tr),
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const VouchersScreen(), withNavBar: true);
                    },
                    child: AccountTile(
                        svg: SvgPicture.asset(
                          svgAssets.vouchers,
                          width: 34.w,
                        ),
                        title: 'Vouchers'.tr),
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const FAQsScreen(), withNavBar: true);
                    },
                    child: AccountTile(
                        svg: SvgPicture.asset(
                          svgAssets.faqs,
                          width: 34.w,
                        ),
                        title: 'FAQs'.tr),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(SupportScreen.routeName);
                    },
                    child: AccountTile(
                        svg: SvgPicture.asset(
                          svgAssets.support,
                          width: 34.w,
                        ),
                        title: 'Support'.tr),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(TermsConditionsScreen.routeName);
                    },
                    child: AccountTile(
                        svg: SvgPicture.asset(
                          svgAssets.termsConditions,
                          width: 34.w,
                        ),
                        title: 'Terms & Conditions.'.tr),
                  ),
                  const SizedBox(
                    height: 1.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 1.5.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              svgAssets.logout,
                              width: 34.w,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(LoginWithScreen.routeName);
                              },
                              child: Text('Log Out'.tr,
                                  style: TextStyle(
                                      fontSize: 15.5,
                                      color: const Color(0xffF16055),
                                      fontFamily: controller
                                          .languagecontroller.fontFamily.value,
                                      fontWeight: FontWeight.w500)),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              svgAssets.noti_arrow,
                              height: 1.8.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: hasBottomNotch ? 150.h : 70.h,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
