import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/new_beneficiary_screen.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';

class AddNewBeneficiaryScreen2 extends StatelessWidget {
  static const routeName = 'AddNewBeneficiaryScreen2';
  const AddNewBeneficiaryScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(size: 24.h),
          centerTitle: false,
          title: const Text('Add New Beneficiary'),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(left: 24.w, top: 10.h, right: 24.w, bottom: 41.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: Get.find<ThemeController>().themeMode.value ==
                          ThemeMode.dark
                      ? Color(0x66FFF3EE)
                      : const Color(0xffFFF3EE),
                  borderRadius: k15BorderRadius,
                  border: Border.all(color: AppColors.kPrimaryColor),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      svgAssets.whiteavatar,
                      width: 50.w,
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      'Bank Name',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Transfer To Bank Account',
                style: TextStyle(fontSize: 17.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Enter Account/IBN Number.',
                style: TextStyle(fontSize: 13.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextFormField(
                decoration: InputDecoration(
                  hintText: 'XXXXXXXX',
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(NewBeneficiaryScreen.routeName);
                  },
                  child: Text('Add New Beneficiary'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
