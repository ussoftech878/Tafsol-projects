import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/utills/custom_colors.dart';
import 'package:flexdrive/view_models/home_veiw_model.dart';

import 'package:flexdrive/widgets/bottomSheet/choose_add_ons_bottom_model_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeDetailScreen extends StatelessWidget {
  static const routeName = 'homedetailscreen';
  const HomeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double percent = 0.0;

    return Consumer<HomeVeiwModel>(builder: (_, bookingDetail, __) {
      var data = bookingDetail.bookingDetailResponse.data;

      availablepercent() {
        num totalRemainingkiloMeters = data!.remainingKilometers!;
        num totalKiloMeter = data.totalKilometers!;
        double value;
        double formatedvalue;
        value = totalRemainingkiloMeters * 100;
        formatedvalue = value / totalKiloMeter;
        if (formatedvalue == 100) {
          percent = 1.0;
          return percent;
        } else if (formatedvalue < 100) {
          double round = formatedvalue / 100;
          percent = round;
          return percent;
        }
      }

      return Scaffold(
        backgroundColor: Colors.white,
        // appBar: const CustomAppBar(title: "", leading: true),
        body: SafeArea(
            child: bookingDetail.getIsloadingDetail
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildShimmerBox(width: 100, height: 30),
                        SizedBox(
                          height: 5.h,
                        ),
                        _buildShimmerBox(width: double.infinity, height: 300.h),
                        SizedBox(
                          height: 10.h,
                        ),
                        _buildShimmerBox(width: double.infinity, height: 300.h)
                      ],
                    ),
                  )
                : data == null
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildShimmerBox(
                                  width: double.infinity, height: 300.h),
                              SizedBox(
                                height: 10.h,
                              ),
                              _buildShimmerBox(
                                  width: double.infinity, height: 300.h)
                            ],
                          ),
                        ),
                      )
                    : Stack(
                        children: [
                          Positioned(
                            bottom: 0.h,
                            left: 0,
                            right: 190.w,
                            child: Image.asset(
                              alignment: Alignment.bottomLeft,
                              Image_assets.splash_vector,
                              width: 290.w,
                              height: 265.w,
                            ),
                          ),
                          Positioned.fill(
                            // top: -30.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 27.15.h,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset(
                                        Image_assets.splash_logo,
                                        width: 139.w,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                      //height: 268.h,
                                      width: double.infinity,
                                      child: Card(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 120.h,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 103.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20.r),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.r)),
                                                  color:
                                                      const Color(0xffF6F5F1),
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
                                                    '${data.car!.make.toString()} ${data.car!.model}',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.kTextBlack,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 7.h,
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
                                                        width: 19.w,
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                      SizedBox(
                                                        width: 9.w,
                                                      ),
                                                      Text(
                                                        "${data.remainingKilometers}/${data.totalKilometers}",
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
                                                    height: 6.h,
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
                                                        data.package!
                                                            .packageType
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
                                                    height: 6.h,
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
                                                        data.tollStationsCrossed
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
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      // height: 311.h,
                                      width: double.infinity,
                                      child: Card(
                                        color: const Color(0xffF6F5F1),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.h, horizontal: 20.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Kilometers",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.kTextBlack,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  //const Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      chooseAddOnsBottomModelSheet(
                                                          context);
                                                    },
                                                    child: Container(
                                                      width: 140.w,
                                                      // padding:
                                                      //     EdgeInsets.all(6.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5.r)),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .kTextBlack)),
                                                      alignment:
                                                          Alignment.center,
                                                      height: 30.h,
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
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10.h),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child:
                                                      CircularPercentIndicator(
                                                    radius: 110.w,
                                                    lineWidth: 10.0,
                                                    percent:
                                                        availablepercent()!,
                                                    center: Text(
                                                      "${data.remainingKilometers}/${data.totalKilometers} KM",
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF161616),
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    linearGradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          AppColors.kgradient1,
                                                          AppColors.kgradient2,
                                                        ]),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Available Kilometers",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF161616),
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
      );
    });
  }

  Widget _buildShimmerBox({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
      ),
    );
  }
}
