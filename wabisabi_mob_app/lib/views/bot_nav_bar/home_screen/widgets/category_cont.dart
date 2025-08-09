// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:wabisabi_mob_app/constants/colors_constants.dart';
// import 'package:wabisabi_mob_app/controllers/home_controller.dart';

// class CategoryContainer extends GetView<HomeController> {
//   final String text;
//   const CategoryContainer({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     final isSelected = controller.selectedCategory.value == text;
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 21.w),
//       decoration: BoxDecoration(
//           border: Border.all(
//             color: isSelected ? AppColors.kPrimaryColor : Colors.transparent,
//           ),
//           borderRadius: BorderRadius.circular(50),
//           color: isSelected ? Color(0xffFFF3EE) : const Color(0xffE9E9E9)),
//       child: Text(text,
//           style: TextStyle(
//               fontSize: 10.sp,
//               color: isSelected ? AppColors.kPrimaryColor : Color(0xff808080))),
//     );
//   }
// }
