import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/widgets/send_money_tile.dart';

class TransactionsScreen extends StatelessWidget {
  static const routeName = 'TransactionsScreen';
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 24.h),
        forceMaterialTransparency: true,
        centerTitle: false,
        title: const Text('Transactions'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Color(0xffCBC3C3), fontSize: 14.sp),
                suffixIcon: SvgPicture.asset(
                  svgAssets.seacrh,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                      "data"); //SendMoneyTile(); //TODO: change this to the send money tile widget
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
