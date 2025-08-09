import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';

class WalletTile extends StatelessWidget {
  final Widget svg;
  final String title;
  const WalletTile({
    super.key,
    required this.svg,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            svg,
            SizedBox(width: 15.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
            )
          ],
        ),
        SizedBox(height: 5.h),
        Divider(
          color: Color(0xffE8E8E8),
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}
