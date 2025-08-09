import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/transaction_successful.dart';

class SendMoneyPincodeScreen extends StatelessWidget {
  static const routeName = 'SendMoneyPincodeScreen';
  const SendMoneyPincodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 24.h),
        title: const Text('Send Money'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text('Hi John Doe',
                style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp)),
            SizedBox(
              height: 16.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                    textAlign: TextAlign.center,
                    'For security reasons, enter your PIN to proceed',
                    style: TextStyle(fontSize: 16.sp))),
            SizedBox(
              height: 45.h,
            ),
            Pinput(
              mainAxisAlignment: MainAxisAlignment.center,
              length: 5, // Number of OTP fields
              obscureText: true,
              obscuringWidget: Container(
                width: 20.w,
                height: 20.h,
                decoration: const BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              defaultPinTheme: PinTheme(
                width: 20.w,
                height: 20.h,
                textStyle: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black, fontSize: 12),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 235, 223, 218),
                  shape: BoxShape.circle,
                  // border: Border.all(color: const Color(0xffB3B3B3)),
                ),
              ),
              errorPinTheme: PinTheme(
                width: 20.w,
                height: 20.h,
                textStyle: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black, fontSize: 12),
                decoration: const BoxDecoration(
                  color: Color(0xffFD2727),
                  shape: BoxShape.circle,
                  // border: Border.all(color: AppColors.kPrimaryColor, width: 1),
                ),
              ),
              // focusedPinTheme: PinTheme(
              //   width: 20,
              //   height: 20,
              //   textStyle: Theme.of(context)
              //       .textTheme
              //       .titleLarge!
              //       .copyWith(color: Colors.black, fontSize: 12),
              //   decoration: BoxDecoration(
              //     color: const Color(0xffFFF3EE),
              //     shape: BoxShape.circle,
              //     border: Border.all(color: AppColors.kPrimaryColor, width: 1),
              //   ),
              // ),
              // submittedPinTheme: PinTheme(
              //   width: 20,
              //   height: 20,
              //   textStyle: Theme.of(context)
              //       .textTheme
              //       .titleLarge!
              //       .copyWith(color: Colors.black, fontSize: 12),
              //   decoration: BoxDecoration(
              //     color: const Color(0xffFFF3EE),
              //     shape: BoxShape.circle,
              //     border: Border.all(color: AppColors.kPrimaryColor, width: 1),
              //   ),
              // ),
              showCursor: false,
              onChanged: (value) {
                if (kDebugMode) {
                  print("Entered OTP: $value");
                }
              },
              onCompleted: (value) {
                if (kDebugMode) {
                  print("Completed OTP: $value");
                }
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showTransactionSuccessfulDialogBox(context);
                },
                child: const Text('Continue'),
              ),
            ),
            k2hSizedBox,
          ],
        ),
      ),
    );
  }
}
