import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    svgAssets.avatar,
                    width: 50.w,
                  ),
                  Positioned(
                    top: 30.h,
                    left: 30.w,
                    child: SvgPicture.asset(
                      svgAssets.arrow,
                      width: 20.w,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Chiamaka Winifred',
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          fontSize: 15.sp,
                        ),
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text('PayPal - 12121212454512',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 11.sp,
                        ),
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text('08:23 AM',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.sp,
                            ),
                          )),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text('Payment Received',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.sp,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(
            //   width: 8.w,
            // ),
            Expanded(
              flex: 1,
              child: Text('\$50.00',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          ],
        ),
        // SizedBox(height: 0.5,),
        SizedBox(
          height: 8.h,
        ),
        const Divider(
          color: Color(0xffE8E8E8),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
