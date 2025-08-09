import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/chatbot_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/profile_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/account_level_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/favorites_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/my_wallet_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/transaction_history_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/widgets/wallet_tile.dart';

class WalletScreen extends StatelessWidget {
  static const routeName = 'WalletScreen';
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 13.w,
            ),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(ChatbotScreen.routeName);
              },
              child: SvgPicture.asset(
                svgAssets.gradientRobot,
                width: 30.w,
                height: 30.h,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffFF7F50).withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: const Offset(2, 12),
                    ),
                  ],
                  gradient: const LinearGradient(colors: [
                    Color(0xffFF7F50),
                    Color(0xffFFDB58),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: k15BorderRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      svgAssets.whiteavatar2,
                      width: 76.w,
                      height: 76.h,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                          Text('PayPal - 12121212454512',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp)),
                          Text('Johndoe12@example.com',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.sp))
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: k15BorderRadius,
                      ),
                      child: Text('Edit',
                          style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontSize: 11.sp,
                          )),
                    )
                  ],
                )),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(MyWalletScreen.routeName);
              },
              child: WalletTile(
                svg: SvgPicture.asset(
                  svgAssets.mywallet,
                  width: 50.w,
                ),
                title: 'My Wallet',
              ),
            ),
            k1hSizedBox,
            GestureDetector(
              onTap: () {
                Get.toNamed(AccountLevelScreen.routeName);
              },
              child: WalletTile(
                svg: SvgPicture.asset(
                  svgAssets.accountlevel,
                  width: 50.w,
                ),
                title: 'Account Level',
              ),
            ),
            k1hSizedBox,
            GestureDetector(
              onTap: () {
                Get.toNamed(TransactionHistoryScreen.routeName);
              },
              child: WalletTile(
                svg: SvgPicture.asset(
                  svgAssets.transhistory,
                  width: 50.w,
                ),
                title: 'Transaction History',
              ),
            ),
            k1hSizedBox,
            GestureDetector(
              onTap: () {
                Get.toNamed(FavoritesScreen.routeName);
              },
              child: WalletTile(
                svg: SvgPicture.asset(
                  svgAssets.myfav,
                  width: 50.w,
                ),
                title: 'My Favourites',
              ),
            ),
            k1hSizedBox,
            GestureDetector(
              onTap: () {
                Get.toNamed(ProfileScreen.routeName);
              },
              child: WalletTile(
                svg: SvgPicture.asset(
                  svgAssets.setting2,
                  width: 50.w,
                ),
                title: 'Settings',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
