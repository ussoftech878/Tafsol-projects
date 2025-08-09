import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/create_agreement_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/preview_screen.dart';
import 'package:wabisabi_mob_app/widgets/agreement_creation_steps.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/add_field.dart';

// ignore: must_be_immutable
class CreateAgreement extends GetView<CreateAgreementController> {
  static const routeName = 'CreateAgreement';
  CreateAgreement({super.key});
  CreateAgreementController controller = Get.put(CreateAgreementController());

  @override
  Widget build(BuildContext context) {
    final bool isEditing = Get.arguments?['isEditing'] ?? false;
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          title: Text(isEditing ? 'Edit Agreement' : 'Create Agreement'),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: 11.h, right: 25.w, left: 25.w, bottom: 30.h),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isEditing
                        ? SizedBox()
                        : AgreementCreationSteps(
                            step: 3,
                          ),
                    Text('Participants',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 13.sp, color: AppColors.kBlackText))),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  imageAssets.person,
                                  width: 40.w,
                                  height: 40.h,
                                ),
                                SizedBox(width: 11.w),
                                Text("Bob Martyn",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color: Color(0xff4A4A4A)))),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '&',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xff4A4A4A), fontSize: 16.sp)),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              imageAssets.person,
                              width: 40.w,
                              height: 40.h,
                            ),
                            SizedBox(width: 11.w),
                            Text("Bob Martyn",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 16.sp,
                                        color: Color(0xff4A4A4A)))),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    Text("Agreement Title Here",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 13.sp, color: AppColors.kBlackText))),
                    SizedBox(
                      height: 10.h,
                    ),
                    //agreement type drop down
                    Obx(() {
                      return DropdownButton2(
                        hint: Text(
                          'Agreement Type',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xffB3B3B3),
                          ),
                        ),
                        underline: SizedBox.shrink(),
                        isExpanded: true,
                        value: controller.selectedAgreementType.value.isEmpty
                            ? null
                            : controller.selectedAgreementType.value,
                        items: controller.agreementTypes
                            .map((type) => DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type,
                                      style: TextStyle(
                                          color: Color(0xff4A4A4A),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400)),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            controller.setAgreementType(value as String),
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Color(0XFFF5F9FE),
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(color: Color(0xffB3B3B3)),
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: AppColors.kScaffoldColor,
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(() {
                      if (controller.showVariableFields.value) {
                        return Column(
                          children: [
                            // Commission Type Dropdown
                            DropdownButton2(
                              hint: Text(
                                'Types',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xffB3B3B3),
                                ),
                              ),
                              underline: SizedBox.shrink(),
                              isExpanded: true,
                              value: controller
                                      .selectedComissiontType.value.isEmpty
                                  ? null
                                  : controller.selectedComissiontType.value,
                              items: controller.commissionTypes
                                  .map((type) => DropdownMenuItem<String>(
                                        value: type,
                                        child: Text(type,
                                            style: TextStyle(
                                                color: Color(0xff4A4A4A),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400)),
                                      ))
                                  .toList(),
                              onChanged: (value) =>
                                  controller.setCommissionType(value as String),
                              buttonStyleData: ButtonStyleData(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.w, vertical: 5.h),
                                decoration: BoxDecoration(
                                  color: Color(0XFFF5F9FE),
                                  borderRadius: BorderRadius.circular(14.r),
                                  border: Border.all(color: Color(0xffB3B3B3)),
                                ),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            controller.showRevenueShareFields.value
                                ? Column(
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Title',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      //payment Trigger
                                      DropdownButton2(
                                        hint: Text(
                                          'Payment Trigger',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xffB3B3B3),
                                          ),
                                        ),
                                        underline: SizedBox.shrink(),
                                        isExpanded: true,
                                        value: controller.selectedPaymentTrigger
                                                .value.isEmpty
                                            ? null
                                            : controller
                                                .selectedPaymentTrigger.value,
                                        items: controller.paymentTrigger
                                            .map((type) =>
                                                DropdownMenuItem<String>(
                                                  value: type,
                                                  child: Text(
                                                    type,
                                                    style: TextStyle(
                                                      color: Color(0xff4A4A4A),
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (value) => controller
                                            .setPaymentTrigger(value as String),
                                        buttonStyleData: ButtonStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                            color: Color(0XFFF5F9FE),
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                            border: Border.all(
                                                color: Color(0xffB3B3B3)),
                                          ),
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: controller
                                                  .revenueSharePercentageController,
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.center,
                                              // decoration: InputDecoration(
                                              //   hintText: '10',
                                              // ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Text('% of total revenue',
                                                style: TextStyle(
                                                    color: Color(0xff4A4A4A),
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Notes',
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink(),

                            controller.showSubscriptionBasedFields.value
                                ? Column(
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Title',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      DropdownButton2(
                                        hint: Text(
                                          'Due Date',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xffB3B3B3),
                                          ),
                                        ),
                                        underline: SizedBox.shrink(),
                                        isExpanded: true,
                                        value: controller
                                                .selectedDueDate.value.isEmpty
                                            ? null
                                            : controller.selectedDueDate.value,
                                        items: controller.dueDates
                                            .map((type) =>
                                                DropdownMenuItem<String>(
                                                  value: type,
                                                  child: Text(
                                                    type,
                                                    style: TextStyle(
                                                      color: Color(0xff4A4A4A),
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (value) => controller
                                            .setDueDate(value as String),
                                        buttonStyleData: ButtonStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                            color: Color(0XFFF5F9FE),
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                            border: Border.all(
                                                color: Color(0xffB3B3B3)),
                                          ),
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      DropdownButton2(
                                        hint: Text(
                                          'Billing Cycle',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xffB3B3B3),
                                          ),
                                        ),
                                        underline: SizedBox.shrink(),
                                        isExpanded: true,
                                        value: controller.selectedBillingCycle
                                                .value.isEmpty
                                            ? null
                                            : controller
                                                .selectedBillingCycle.value,
                                        items: controller.billingCycle
                                            .map((type) =>
                                                DropdownMenuItem<String>(
                                                  value: type,
                                                  child: Text(
                                                    type,
                                                    style: TextStyle(
                                                      color: Color(0xff4A4A4A),
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (value) => controller
                                            .setBillingCycle(value as String),
                                        buttonStyleData: ButtonStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                            color: Color(0XFFF5F9FE),
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                            border: Border.all(
                                                color: Color(0xffB3B3B3)),
                                          ),
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: 'Payment Amount',
                                          prefixIcon: Icon(Icons.attach_money),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Notes',
                                        ),
                                      )
                                    ],
                                  )
                                : SizedBox.shrink(),

                            controller.showPerformanceBasedFields.value
                                ? Column(
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Title',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      DropdownButton2(
                                        hint: Text(
                                          'Due Date',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xffB3B3B3),
                                          ),
                                        ),
                                        underline: SizedBox.shrink(),
                                        isExpanded: true,
                                        value: controller
                                                .selectedPerformanceDueDate
                                                .value
                                                .isEmpty
                                            ? null
                                            : controller
                                                .selectedPerformanceDueDate
                                                .value,
                                        items: controller.performanceDueDates
                                            .map((type) =>
                                                DropdownMenuItem<String>(
                                                  value: type,
                                                  child: Text(
                                                    type,
                                                    style: TextStyle(
                                                      color: Color(0xff4A4A4A),
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (value) =>
                                            controller.setPerformanceDueDate(
                                                value as String),
                                        buttonStyleData: ButtonStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                            color: Color(0XFFF5F9FE),
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                            border: Border.all(
                                                color: Color(0xffB3B3B3)),
                                          ),
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Performance Criteria'),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextField(
                                        controller: controller
                                            .performanceBonusAmountController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.attach_money),
                                            hintText: 'Bonus Amount'),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextField(
                                        decoration:
                                            InputDecoration(hintText: 'Notes'),
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink(),
                            controller.showCommissionBaseFields.value
                                ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          // Amount Input
                                          Expanded(
                                            child: TextField(
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15.w),
                                          // Sale Type Dropdown
                                          Expanded(
                                              flex: 2,
                                              child: DropdownButton2(
                                                hint: Text(
                                                  'Commission Type',
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color:
                                                        const Color(0xffB3B3B3),
                                                  ),
                                                ),
                                                underline: SizedBox.shrink(),
                                                isExpanded: true,
                                                value: controller
                                                        .selectedSaleType
                                                        .value
                                                        .isEmpty
                                                    ? null
                                                    : controller
                                                        .selectedSaleType.value,
                                                items: controller.saleTypes
                                                    .map((type) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: type,
                                                          child: Text(type,
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff4A4A4A),
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ))
                                                    .toList(),
                                                onChanged: (value) =>
                                                    controller.selectedSaleType(
                                                        value as String),
                                                buttonStyleData:
                                                    ButtonStyleData(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 0.w,
                                                      vertical: 5.h),
                                                  decoration: BoxDecoration(
                                                    color: Color(0XFFF5F9FE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.r),
                                                    border: Border.all(
                                                        color:
                                                            Color(0xffB3B3B3)),
                                                  ),
                                                ),
                                                dropdownStyleData:
                                                    DropdownStyleData(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.r),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      // Duration Type Dropdown
                                      DropdownButton2(
                                        hint: Text(
                                          'Duration',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xffB3B3B3),
                                          ),
                                        ),
                                        underline: SizedBox.shrink(),
                                        isExpanded: true,
                                        value: controller.selectedDurationType
                                                .value.isEmpty
                                            ? null
                                            : controller
                                                .selectedDurationType.value,
                                        items: controller.durationTypes
                                            .map((type) =>
                                                DropdownMenuItem<String>(
                                                  value: type,
                                                  child: Text(type,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff4A4A4A),
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ))
                                            .toList(),
                                        onChanged: (value) => controller
                                            .setDurationType(value as String),
                                        buttonStyleData: ButtonStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                            color: Color(0XFFF5F9FE),
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                            border: Border.all(
                                                color: Color(0xffB3B3B3)),
                                          ),
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : SizedBox.shrink()

                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            // Row(
                            //   children: [
                            //     // Amount Input
                            //     Expanded(
                            //       child: TextField(
                            //         decoration: InputDecoration(
                            //           hintText: 'Amount',
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(width: 15.w),
                            //     // Sale Type Dropdown
                            //     Expanded(
                            //         flex: 2,
                            //         child: DropdownButton2(
                            //           underline: SizedBox.shrink(),
                            //           isExpanded: true,
                            //           value: controller.selectedSaleType.value,
                            //           items: controller.saleTypes
                            //               .map((type) =>
                            //                   DropdownMenuItem<String>(
                            //                     value: type,
                            //                     child: Text(type,
                            //                         style: TextStyle(
                            //                             color:
                            //                                 Color(0xff4A4A4A),
                            //                             fontSize: 16.sp,
                            //                             fontWeight:
                            //                                 FontWeight.w400)),
                            //                   ))
                            //               .toList(),
                            //           onChanged: (value) => controller
                            //               .selectedSaleType(value as String),
                            //           buttonStyleData: ButtonStyleData(
                            //             padding: EdgeInsets.symmetric(
                            //                 horizontal: 0.w, vertical: 5.h),
                            //             decoration: BoxDecoration(
                            //               color: Color(0XFFF5F9FE),
                            //               borderRadius:
                            //                   BorderRadius.circular(14.r),
                            //               border: Border.all(
                            //                   color: Color(0xffB3B3B3)),
                            //             ),
                            //           ),
                            //           dropdownStyleData: DropdownStyleData(
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(14.r),
                            //             ),
                            //           ),
                            //         )),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            // Duration Type Dropdown
                            // DropdownButton2(
                            //   underline: SizedBox.shrink(),
                            //   isExpanded: true,
                            //   value: controller.selectedDurationType.value,
                            //   items: controller.durationTypes
                            //       .map((type) => DropdownMenuItem<String>(
                            //             value: type,
                            //             child: Text(type,
                            //                 style: TextStyle(
                            //                     color: Color(0xff4A4A4A),
                            //                     fontSize: 16.sp,
                            //                     fontWeight: FontWeight.w400)),
                            //           ))
                            //       .toList(),
                            //   onChanged: (value) =>
                            //       controller.setDurationType(value as String),
                            //   buttonStyleData: ButtonStyleData(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 0.w, vertical: 5.h),
                            //     decoration: BoxDecoration(
                            //       color: Color(0XFFF5F9FE),
                            //       borderRadius: BorderRadius.circular(14.r),
                            //       border: Border.all(color: Color(0xffB3B3B3)),
                            //     ),
                            //   ),
                            //   dropdownStyleData: DropdownStyleData(
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(14.r),
                            //     ),
                            //   ),
                            // )
                          ],
                        );
                      }
                      return SizedBox.shrink();
                    }),

                    SizedBox(
                      height: 10.h,
                    ),
                    //dynamic fields
                    Obx(() {
                      return Column(
                        children:
                            controller.fields.asMap().entries.map((entry) {
                          int index = entry.key;
                          String fieldName = entry.value;

                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: TextField(
                              controller: controller.fieldControllers[index],
                              decoration: InputDecoration(
                                hintText: fieldName,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showAddFieldDialogBox(context, controller);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 15.w),
                              textStyle: TextStyle(
                                  color: AppColors.kBlackText,
                                  fontFamily: 'Poppins',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r)),
                              backgroundColor: AppColors.kPrimaryColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
                            ),
                            child: Text('Add Field'))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // Dynamic Milestones Section
                    Obx(() {
                      return Column(
                        children: controller.milestones.map((milestoneIndex) {
                          var milestoneControllers =
                              controller.milestoneControllers[milestoneIndex];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Milestone $milestoneIndex",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400))),
                              SizedBox(height: 10.h),
                              TextField(
                                controller: milestoneControllers?["title"],
                                decoration: InputDecoration(
                                  hintText: 'Title',
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextField(
                                controller: milestoneControllers?["dueDate"],
                                decoration: InputDecoration(
                                  hintText: 'Due Date',
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextField(
                                controller:
                                    milestoneControllers?["paymentAmount"],
                                decoration: InputDecoration(
                                  hintText: 'Payment Amount',
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextField(
                                controller: milestoneControllers?["notes"],
                                decoration: InputDecoration(
                                  hintText: 'Notes',
                                ),
                              ),
                              SizedBox(height: 15.h),
                            ],
                          );
                        }).toList(),
                      );
                    }),
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
              //bottom buttons
              Obx(() => Visibility(
                    visible: !isKeyboardVisible,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: AppColors.kScaffoldColor,
                        padding: EdgeInsets.only(top: 10.h),
                        child: controller.showVariableFields.value
                            ? SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(() => PreviewScreen(), arguments: {
                                        'isVariablePrice': true,
                                      });
                                    },
                                    child: Text('Preview')),
                              )
                            : Row(
                                children: [
                                  Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if (isEditing) {
                                              Get.back();
                                            } else {
                                              Get.toNamed(
                                                  PreviewScreen.routeName);
                                            }
                                          },
                                          child: Text(
                                              isEditing ? "Save" : 'Preview'))),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                      child: OutlinedButton(
                                          onPressed: () {
                                            controller.addMilestone();
                                          },
                                          child: Text(isEditing
                                              ? 'Cancel'
                                              : 'Add Milestone'))),
                                ],
                              ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
