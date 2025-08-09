import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/QR_screen/send_money_pincode_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/widgets/detail_container.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/widgets/transfer_detail_cont.dart';

class QrSendMoneyScreen extends StatelessWidget {
  static const routeName = 'QrSendMoneyScreen';
  const QrSendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(size: 24.h),
          title: const Text('Send Money'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Details',
                  style: TextStyle(fontSize: 17.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const DetailContainer(
                    title1: 'Account Title:',
                    title2: 'Bank Name:',
                    title3: 'Account #:',
                    des1: 'John Doe',
                    des2: 'Bank Name Here',
                    des3: '14214521454121'),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Transfer Details',
                  style: TextStyle(fontSize: 17.4.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const TransferDetailContainer(
                    title1: 'Amount:',
                    title2: 'Bank Charges',
                    title3: 'Total Amount',
                    des1: '\$00.00',
                    des2: '\$00.00',
                    des3: '\$00.00'),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Enter Amount',
                  style: TextStyle(fontSize: 17.4.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const TextField(
                    decoration: InputDecoration(hintText: 'XXXXXXX')),
                // const Spacer(),
                SizedBox(
                  height: 231.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(SendMoneyPincodeScreen.routeName);
                            },
                            child: const Text('Pay Now'))),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                        child: OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Get.find<ThemeController>()
                                                .themeMode
                                                .value ==
                                            ThemeMode.dark
                                        ? AppColors.kWhiteColor
                                        : Colors.transparent)),
                            onPressed: () {},
                            child: const Text('Cancel'))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
