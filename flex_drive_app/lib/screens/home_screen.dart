import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/utills/custom_colors.dart';
import 'package:flexdrive/view_models/home_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print("homescreen build run");
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                Image_assets.splash_logo,
                width: 139.w,
              ),
            ),
            SizedBox(
              height: 26.82.h,
            ),
            Expanded(
              child: Consumer<HomeVeiwModel>(builder: (_, homeVeiwModel, __) {
                return homeVeiwModel.getIsloading
                    ? const Center(child: CircularProgressIndicator())
                    : homeVeiwModel.myBookingList.isEmpty
                        ? RefreshIndicator(
                            onRefresh: () =>
                                homeVeiwModel.getMyBooking(callFirstTime: true),
                            child: ListView(
                              physics: AlwaysScrollableScrollPhysics(),
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 160.0),
                                  child: Center(
                                    child: Text("No Bookings Available"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () =>
                                homeVeiwModel.getMyBooking(callFirstTime: true),
                            child: ListView.builder(
                                controller: homeVeiwModel.controller,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: homeVeiwModel.myBookingList.length +
                                    (homeVeiwModel.isPageLoading ? 1 : 0),
                                itemBuilder: (context, index) {
                                  if (index ==
                                      homeVeiwModel.myBookingList.length) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  var getMybooking =
                                      homeVeiwModel.myBookingList[index];
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 148.h,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 103.w,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20.r),
                                                    topLeft:
                                                        Radius.circular(20.r)),
                                                color: const Color(0xffF6F5F1),
                                              ),
                                              child: Image.asset(
                                                Image_assets.car,
                                                width: 182.w,
                                              )),
                                          Padding(
                                            padding: EdgeInsets.all(20.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${getMybooking.car!.make} ${getMybooking.car!.model}",
                                                  style: TextStyle(
                                                    color: AppColors.kTextBlack,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Available Kilometer.",
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF9F9F9F),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    SvgPicture.asset(
                                                      SvgAssets.speed,
                                                      width: 19.45.w,
                                                      height: 15.36.h,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    SizedBox(
                                                      width: 9.w,
                                                    ),
                                                    Text(
                                                      "${getMybooking.remainingKilometers}/${getMybooking.totalKilometers}",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .kTextBlack,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Current Subscription:",
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF9F9F9F),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      getMybooking
                                                          .package!.packageType
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Toll Stations Crossed",
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF9F9F9F),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      getMybooking
                                                          .tollStationsCrossed
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<HomeVeiwModel>()
                                                          .getBookDetail(
                                                              getMybooking
                                                                  .bookingId!);

                                                      Navigator.pushNamed(
                                                          context,
                                                          homeDetailRoute);
                                                    },
                                                    child: Container(
                                                      height: 30.h,
                                                      width: double.infinity,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5.r)),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                              width: 1.w)),
                                                      child: Text(
                                                        "Buy Additional KM",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
              }),
            )
          ],
        ),
      ),
    );
  }
}
