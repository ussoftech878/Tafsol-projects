import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/widgets/bank_name_tile.dart';

class AddNewBeneficiary extends StatelessWidget {
  static const routeName = 'AddNewBeneficiary';
  const AddNewBeneficiary({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.h),
          child: AppBar(
            iconTheme: IconThemeData(size: 24.h),
            centerTitle: false,
            title: const Text('Add New Beneficiary'),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle:
                        TextStyle(color: Color(0xffCBC3C3), fontSize: 14.sp),
                    suffixIcon: SvgPicture.asset(
                      svgAssets.seacrh,
                      height: 21.5.sp,
                      width: 21.5.sp,
                      fit: BoxFit.scaleDown,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                return BankNameTile();
              }))
            ],
          ),
        ),
      ),
    );
  }
}
