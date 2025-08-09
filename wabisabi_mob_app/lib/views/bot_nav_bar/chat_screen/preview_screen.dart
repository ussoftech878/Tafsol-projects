// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/create_agreement.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/msg_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/milestone_preview_chip.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/agreement_history.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/milestone_fund.dart';

class PreviewScreen extends StatefulWidget {
  static const routeName = 'PreviewScreen';
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isVariablePrice = Get.arguments?['isVariablePrice'] ?? false;
    final bool isViewContract = Get.arguments?['isViewContract'] ?? false;
    // final bool isEditing = Get.arguments?['isEditing'] ?? false;

    List<Widget> milestones = List.generate(
      3,
      (index) => MilestonePreviewChip(
        key: Key('milestone_$index'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreements'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () {
                showAgreementHistoryDialogBox(context);
              },
              child: SvgPicture.asset(
                svgAssets.history,
                height: 24.h,
                width: 24.h,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 11.h, bottom: 30.h),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Participants',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.kBlackText,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  imageAssets.person,
                                  width: 40.w,
                                  height: 40.h,
                                ),
                                SizedBox(width: 11.w),
                                Text(
                                  "Bob Martyn",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xff4A4A4A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '&',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xff4A4A4A),
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  imageAssets.person,
                                  width: 40.w,
                                  height: 40.h,
                                ),
                                SizedBox(width: 11.w),
                                Text(
                                  "Bob Martyn",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xff4A4A4A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        Text(
                          "Agreement Title Here",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.kBlackText,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        isVariablePrice
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Agreement Type:',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Variable Price',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Payout Rate:',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Commission',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Payout Type:',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'By Sales',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Duration:',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Every Week',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Description:',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Client feedback required before proceeding to the next stage.',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Agreement Type:',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Fixed Price',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Description:',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Client feedback required before proceeding to the next stage.',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Additional Info:',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Here will come the information about the process.',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: 25.h,
                        ),
                      ],
                    ),
                  ),
                  isVariablePrice
                      ? SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Text(
                                'All Milestones',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors.kBlackText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            ReorderableListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: milestones.length,
                              itemBuilder: (context, index) {
                                return milestones[index];
                              },
                              onReorder: (int oldIndex, int newIndex) {
                                setState(() {
                                  if (oldIndex < newIndex) {
                                    newIndex -= 1;
                                  }
                                  final Widget item =
                                      milestones.removeAt(oldIndex);
                                  milestones.insert(newIndex, item);
                                });
                              },
                              proxyDecorator: (Widget child, int index,
                                  Animation<double> animation) {
                                return Material(
                                  elevation: 6,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white.withOpacity(0.9),
                                  child: child,
                                );
                              },
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: AppColors.kScaffoldColor,
                  padding: EdgeInsets.only(top: 10.h),
                  child: SizedBox(
                      width: double.infinity,
                      child: isViewContract
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    // print('amasdssssssssssssssssssss');
                                    Get.to(() => CreateAgreement(), arguments: {
                                      'isEditing': true,
                                      // 'isViewContract': true,
                                    });
                                  },
                                  child: Text('Edit')),
                            )
                          : Row(
                              children: [
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          isVariablePrice
                                              ? Get.offNamed(
                                                  MsgScreen.routeName)
                                              : showMilestoneFundDialogBox(
                                                  context);
                                        },
                                        child: Text('Save'))),
                                SizedBox(width: 10.w),
                                Expanded(
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text('Cancel'))),
                              ],
                            )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
