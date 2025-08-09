import 'package:flexdrive/utills/Colored_print.dart';
import 'package:flexdrive/utills/custom_colors.dart';
import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/screens/card_management_screen.dart';
import 'package:flexdrive/screens/home_screen.dart';
import 'package:flexdrive/screens/profile_screen.dart';
import 'package:flexdrive/view_models/home_veiw_model.dart';
import 'package:flexdrive/view_models/navbar_model.dart';
import 'package:flexdrive/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomNavBarScreen extends StatefulWidget {
  static const routeName = 'BottomNavBar';
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  BottomNavModel? _bottomNavModel;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _bottomNavModel = context.read<BottomNavModel>();
    _bottomNavModel?.changeTabToHome();
  }

  @override
  void initState() {
    context.read<HomeVeiwModel>().getMyBooking(callFirstTime: true);
    context.read<ProfileVeiwModel>().getMyProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<BottomNavModel>().selectedTab;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: 0.h,
                left: 0,
                right: 180.w,
                child: Image.asset(
                  alignment: Alignment.bottomLeft,
                  Image_assets.splash_vector,
                  width: 290.w,
                ),
              ),
              Consumer<BottomNavModel>(
                builder: (_, model, __) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: () {
                        if (controller == SelectedTab.home) {
                          return HomeScreen();
                        } else if (controller == SelectedTab.cardManagement) {
                          return const CardManagementScreen();
                        } else if (controller == SelectedTab.profile) {
                          return const ProfileScreen();
                        } else {
                          return HomeScreen();
                        }
                      }());
                },
              )
            ],
          ),
        ),
        bottomNavigationBar:
            Consumer<BottomNavModel>(builder: (context, model, _) {
          return Container(
            height: 72.h,
            decoration: const BoxDecoration(
              color: AppColors.kbottomnavbarcolor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: GNav(
                rippleColor: Colors.transparent!,
                hoverColor: Colors.transparent,
                gap: 0,
                activeColor: Colors.white,
                tabBorderRadius: 5.r,
                padding: EdgeInsets.all(0.w),
                duration: const Duration(milliseconds: 400),
                style: GnavStyle.google,
                tabBackgroundColor: AppColors.kbottomnavbarcolor,
                color: Colors.black,
                tabs: [
                  GButton(
                    padding: EdgeInsets.only(top: 7.h),
                    backgroundGradient: const LinearGradient(colors: [
                      AppColors.kgradient1,
                      AppColors.kgradient2,
                    ]),
                    icon: Icons.home,
                    leading: SizedBox(
                      width: 123.w,
                      height: 50.h,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            width: 16.w,
                            height: 16.h,
                            SvgAssets.home,
                            color: controller == SelectedTab.home
                                ? Colors.white
                                : Colors.black,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: controller == SelectedTab.home
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GButton(
                    padding: EdgeInsets.only(top: 7.h),
                    backgroundGradient: const LinearGradient(colors: [
                      AppColors.kgradient1,
                      AppColors.kgradient2,
                    ]),
                    icon: Icons.credit_card,
                    leading: SizedBox(
                      width: 123.w,
                      height: 50.h,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            width: 16.w,
                            height: 16.h,
                            SvgAssets.card,
                            color: controller == SelectedTab.cardManagement
                                ? Colors.white
                                : Colors.black,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "Card Management",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: controller == SelectedTab.cardManagement
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                    text: '',
                  ),
                  GButton(
                    padding: EdgeInsets.only(top: 7.h),
                    backgroundGradient: const LinearGradient(colors: [
                      AppColors.kgradient1,
                      AppColors.kgradient2,
                    ]),
                    icon: Icons.person,
                    leading: Container(
                      width: 123.w,
                      height: 50.h,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            height: 16.h,
                            width: 16.w,
                            SvgAssets.user,
                            color: controller == SelectedTab.profile
                                ? Colors.white
                                : Colors.black,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: controller == SelectedTab.profile
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                    text: '',
                  ),
                ],
                selectedIndex: 0,
                onTabChange: (index) {
                  setState(() {
                    model.changeTab(index);
                  });
                },
              ),
            ),
          );
        }));
  }
}
