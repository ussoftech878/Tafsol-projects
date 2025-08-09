import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/view_models/auth_view_model.dart';
import 'package:flexdrive/view_models/exception_handling.dart';
import 'package:flexdrive/view_models/profile_view_model.dart';
import 'package:flexdrive/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Profile Setting", leading: false),
        body: SafeArea(
          child: Consumer<ProfileVeiwModel>(builder: (_, profileVeiwModel, __) {
            var profileVeiw = profileVeiwModel.getMyProfileModel.user;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: RefreshIndicator(
                onRefresh: profileVeiwModel.getMyProfile,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(children: [
                    SizedBox(
                      height: 43.h,
                    ),
                    profileVeiw == null
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              Stack(
                                children: [
                                  ClipOval(
                                      child: Image.network(
                                    "${profileVeiw.photo}",
                                    height: 90.w,
                                    width: 90.w,
                                  )),
                                  Positioned(
                                    bottom: 1.h,
                                    right: 0,
                                    child: SvgPicture.asset(
                                      SvgAssets.edit_photos,
                                      fit: BoxFit.scaleDown,
                                      width: 24.w,
                                      height: 24.w,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "${profileVeiw.fullName}",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "${profileVeiw.email}",
                                style: TextStyle(
                                  color: const Color(0xFF9A9999),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 0.86.w,
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x19000000),
                            blurRadius: 20.r,
                            offset: const Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Account Settings",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 50.h,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, updatePasswordRoute);
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        SvgAssets.lock,
                                        fit: BoxFit.scaleDown,
                                        width: 24.w,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        "Change Password",
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 24.w,
                                        color: const Color(0xFF04BFB6),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 2.h,
                              // ),
                              Divider(
                                thickness: 0.5.h,
                              ),
                              SizedBox(
                                height: 50.h,
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        SvgAssets.document,
                                        fit: BoxFit.scaleDown,
                                        width: 24.w,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        "Terms and Conditions",
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 24.w,
                                        color: const Color(0xFF04BFB6),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 30.h,
                              // ),
                              SizedBox(
                                height: 59.h,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 1.5.h,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          SvgAssets.document,
                                          fit: BoxFit.scaleDown,
                                          width: 24.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          "Privacy Policy",
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 24.w,
                                          color: const Color(0xFF04BFB6),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 30.h,
                              // ),
                              SizedBox(
                                height: 59.h,
                                child: InkWell(
                                  onTap: () {
                                    var addApi =
                                        profileVeiwModel.logOutFunction;
                                    if (!context
                                        .read<ExceptionHandling>()
                                        .listOfAPi
                                        .contains(addApi)) {
                                      context
                                          .read<ExceptionHandling>()
                                          .listOfAPi
                                          .add(addApi);
                                      print(context
                                          .read<ExceptionHandling>()
                                          .listOfAPi);
                                    }

                                    profileVeiwModel.logOutFunction();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 1.5.h,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          SvgAssets.logout,
                                          fit: BoxFit.scaleDown,
                                          width: 24.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          "Logout",
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 24.w,
                                          color: const Color(0xFF04BFB6),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            );
          }),
        ));
  }
}
