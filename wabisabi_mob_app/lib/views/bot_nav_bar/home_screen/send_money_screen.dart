import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/home_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/add_new_beneficiary.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/widgets/send_money_tile.dart';

class SendMoneyScreen extends GetView<HomeController> {
  static const routeName = 'SendMoneyScreen';
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isPayContactScreen =
        Get.arguments?['isPayContactScreen'] ?? false;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(size: 24.h),
          forceMaterialTransparency: true,
          centerTitle: false,
          title: Text(isPayContactScreen ? "Pay Contact" : 'Send Money'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(color: Color(0xffCBC3C3), fontSize: 14.sp),
                  suffixIcon: SvgPicture.asset(
                    svgAssets.seacrh,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AddNewBeneficiary.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      svgAssets.user,
                      width: 20.w,
                    ),
                    SizedBox(width: 10.w),
                    const Text('Add New Beneficiary'),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryContainer(text: 'Family'),
                  CategoryContainer(text: 'Friends'),
                  CategoryContainer(text: 'Favorites'),
                  CategoryContainer(text: 'Blocked'),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                        "Hello"); //SendMoneyTile(); //TODO: change this to SendMoneyTile
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  final String text;
  CategoryContainer({super.key, required this.text});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.selectedCategory.value == text;
      return GestureDetector(
        onTap: () {
          controller.selectedCategory.value = text;
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 21.w),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.kPrimaryColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(50),
            color: isSelected ? Color(0xffFFF3EE) : const Color(0xffE9E9E9),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10.sp,
              color: isSelected ? AppColors.kPrimaryColor : Color(0xff808080),
            ),
          ),
        ),
      );
    });
  }
}
