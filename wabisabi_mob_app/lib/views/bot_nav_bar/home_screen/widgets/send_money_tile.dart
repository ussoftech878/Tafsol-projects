import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/home_controller.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/models/response/Beneficiary_response_model.dart';
import 'package:wabisabi_mob_app/services/customPrint.dart';

class SendMoneyTile extends StatelessWidget {
  final Beneficiary beneficiary;
  const SendMoneyTile({super.key, required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    return beneficiary.walletNumber == null
        ? Center(
            child: Column(
              children: [CircularProgressIndicator()],
            ),
          )
        : InkWell(
            onTap: () async {
              HomeController homeController = Get.find<HomeController>();
              await homeController.GetBeneficiaryDetails(
                  beneficiary.beneficiaryId.toString());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /* Expanded(
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            svgAssets.avatar,
                            width: 50.w,
                          ),
                          Positioned(
                            top: 30.h,
                            left: 30.w,
                            child: SvgPicture.asset(
                              svgAssets.arrow,
                              width: 20.w,
                            ),
                          )
                        ],
                      ),
                    ), */
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(beneficiary.beneficiaryName.toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(beneficiary.walletNumber.toString(),
                              style: TextStyle(
                                fontSize: 11.sp,
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          /*  Row(
                      children: [
                        Text('08:23 AM',
                            style: TextStyle(
                              fontSize: 11.sp,
                            )),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text('Payment Recieved',
                            style: TextStyle(
                              fontSize: 11.sp,
                            )),
                      ],
                    )
                   */
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 9.w,
                    // ),
                    SvgPicture.asset(
                      svgAssets.star,
                      width: 17.2.w,
                      color: Get.find<ThemeController>().themeMode.value ==
                              ThemeMode.dark
                          ? Colors.white
                          : null,
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    SvgPicture.asset(
                      svgAssets.trash,
                      width: 17.2.w,
                      color: Get.find<ThemeController>().themeMode.value ==
                              ThemeMode.dark
                          ? Colors.white
                          : null,
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    SvgPicture.asset(
                      svgAssets.edit,
                      width: 17.2.w,
                      color: Get.find<ThemeController>().themeMode.value ==
                              ThemeMode.dark
                          ? Colors.white
                          : null,
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Divider(
                  color: Color(0xffE8E8E8),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          );
  }
}
