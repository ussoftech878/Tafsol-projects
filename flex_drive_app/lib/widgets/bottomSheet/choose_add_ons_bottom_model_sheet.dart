import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/widgets/bottomSheet/card_info_model_sheet.dart';
import 'package:flexdrive/widgets/custom_text_field.dart';
import 'package:flexdrive/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void chooseAddOnsBottomModelSheet(BuildContext context) {
  showModalBottomSheet(
    constraints: const BoxConstraints(maxWidth: double.maxFinite),
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Choose Add ons",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                  suffix: SvgPicture.asset(
                    SvgAssets.arrow_down,
                    fit: BoxFit.scaleDown,
                    color: Color(0xFF04BFB6),
                  ),
                  prefix: SvgPicture.asset(
                    SvgAssets.card,
                    fit: BoxFit.scaleDown,
                    color: Color(0xFF04BFB6),
                  ),
                  hint: "250 km"),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add On Price",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xFF9F9F9F),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "699NOK",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              GradientButton(
                  onPressed: () {
                    cardInfoModelSheet(context);
                  },
                  text: "Proceed to Pay"),
            ],
          ),
        ),
      );
    },
  );
}
