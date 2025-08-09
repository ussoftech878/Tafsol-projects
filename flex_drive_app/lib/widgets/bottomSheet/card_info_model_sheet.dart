import 'package:flexdrive/widgets/custom_text_field.dart';
import 'package:flexdrive/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void cardInfoModelSheet(BuildContext context) {
  showModalBottomSheet(
    constraints: BoxConstraints(maxWidth: double.infinity.w),
    backgroundColor: Colors.white,
    context: context,
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
              Text("Debit/Credit Card",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 15.h,
              ),
              Text("Card Number",
                  style: TextStyle(
                    color: Color(0xFF161616),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: 12.h,
              ),
              CustomTextField(
                hint: "0000 0000 0000 0000",
              ),
              SizedBox(
                height: 15.h,
              ),
              Text("Card Holder Name",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: 12.h,
              ),
              CustomTextField(
                hint: "Card Holder Name",
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Expiry Date",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Text(
                      "CVV",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  const Expanded(
                    child: CustomTextField(
                      hint: "Expiry Date",
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  const Expanded(
                    child: CustomTextField(
                      hint: "CVV",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              GradientButton(text: "Pay", onPressed: () {})
            ],
          ),
        ),
      );
    },
  );
}
