import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';

import '../../../../controllers/language_controller.dart';

class CardContainer extends StatefulWidget {
  final Widget svg;
  final bool isSelected;
  final ValueChanged<bool>
      onSelected; // Callback to notify parent when selected
  const CardContainer({
    super.key,
    required this.svg,
    this.isSelected = false,
    required this.onSelected,
  });

  @override
  _CardContainerState createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  bool isChecked = false;
  Languagecontroller languagecontroller = Get.find<Languagecontroller>();

  @override
  void initState() {
    super.initState();
    isChecked = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant CardContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      setState(() {
        isChecked = widget.isSelected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(!isChecked); // Notify the parent to update selection
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isChecked ? const Color(0xffDEE8E7) : AppColors.kScaffoldColor,
          border: Border.all(
            color:
                isChecked ? AppColors.kPrimaryColor : const Color(0xffE2E5E8),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.svg,
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visa ending in 1234'.tr,
                  style: TextStyle(
                    fontFamily: languagecontroller.fontFamily.value,
                    fontSize: 14.sp,
                    color: isChecked
                        ? const Color(0xff252525)
                        : const Color(0xff4F4F4F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Expiry 06/2024',
                  style: TextStyle(
                    fontFamily: languagecontroller.fontFamily.value,
                    fontSize: 14.sp,
                    color: isChecked
                        ? const Color(0xff252525)
                        : const Color(0xff4F4F4F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  isChecked ? 'Default card'.tr : 'Set as default'.tr,
                  style: TextStyle(
                    fontFamily: languagecontroller.fontFamily.value,
                    fontSize: 14.sp,
                    color: isChecked
                        ? const Color(0xff252525)
                        : AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topLeft,
              child: Transform.scale(
                // scaleX: 8.w,
                scale: 0.9.w,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    widget.onSelected(
                        value!); // Toggle selection on checkbox click
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  activeColor: AppColors.kPrimaryColor,
                  side: const BorderSide(color: Color(0xffD0D5DD)),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  splashRadius: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
