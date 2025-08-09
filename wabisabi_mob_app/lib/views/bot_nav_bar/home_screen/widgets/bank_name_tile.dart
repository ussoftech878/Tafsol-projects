import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/add_new_beneficiary_screen2.dart';

class BankNameTile extends StatelessWidget {
  const BankNameTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AddNewBeneficiaryScreen2.routeName);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                svgAssets.avatar,
                width: 50.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text('Bank Name',
                  style: TextStyle(
                    fontSize: 16.sp,
                  )),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          // k1hSizedBox,
          const Divider(
            color: Color(0xffE8E8E8),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
