import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/controllers/CorporateInfoController.dart';
import 'package:wazefni_iraq/controllers/EmailInfoScreen_controller.dart';
import 'package:wazefni_iraq/controllers/EmpolyerEmailController.dart';
import 'package:wazefni_iraq/controllers/InstitutionInfoController.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/widgets/custom_textfield.dart';
import 'package:wazefni_iraq/widgets/tooltip.dart';

class CorporateEmailInfoScreen extends StatefulWidget {
  static const routeName = 'CorporateEmailInfoScreen';
  const CorporateEmailInfoScreen({super.key});

  @override
  State<CorporateEmailInfoScreen> createState() =>
      _CorporateEmailInfoScreenState();
}

class _CorporateEmailInfoScreenState extends State<CorporateEmailInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/png/company_info.png",
            height: 180.w,
            fit: BoxFit.cover,
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 135.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: info()),
        ],
      ),
    );
  }
}

class info extends StatelessWidget {
  const info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Languagecontroller lang_controller = Get.put(Languagecontroller());
    final Corporateinfocontroller controller =
        Get.put(Corporateinfocontroller());
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 10.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Make a great first impression'.tr,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 14.sp,
                fontFamily: lang_controller.fontFamily.value,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Text(
                'Upload your logo to represent your business professionally.'
                    .tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontFamily: lang_controller.fontFamily.value,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 24.w,
            ),
            Center(
                child: Column(
              children: [
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(svgAssets.Company_logo)),
                SizedBox(
                  height: 4.w,
                ),
                Text(
                  'Your logo'.tr,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 12.sp,
                    fontFamily: lang_controller.fontFamily.value,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )),
            SizedBox(
              height: 28.w,
            ),
            Text(
              'Enter Company Information'.tr,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 14.sp,
                fontFamily: lang_controller.fontFamily.value,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Text(
              textAlign: TextAlign.start,
              'Enter data accurately for a unique and precise experience. Your information is private and visible only to you.'
                  .tr,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 12.sp,
                fontFamily: lang_controller.fontFamily.value,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 16.w,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => CustomTextFormField(
                        style: TextStyle(
                          color: AppColors.blackColor,
                        ),
                        controller: controller.CompanyNameController,
                        validator: (value) {
                          if (GetUtils.isBlank(value)!) {
                            return 'This field requires at least the binary name'
                                .tr;
                          }
                          return null;
                        },
                        onchange: () {
                          if (_formKey.currentState!.validate()) {
                            controller.isEnabled.value = true;
                          } else {
                            controller.isEnabled.value = false;
                          } //controller.isEnabled.value = true;
                        },
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: AppColors.GenderLabel,
                              fontSize: 12.sp,
                              fontFamily: lang_controller.fontFamily.value,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: "Name of hiring manager".tr,
                            border: const OutlineInputBorder(),
                            prefixIcon: SvgPicture.asset(
                              width: 20,
                              height: 20,
                              svgAssets.user,
                              fit: BoxFit.scaleDown,
                            ),
                            suffixIcon: CustomTooltip(
                                message: "At least a binary name".tr)),
                      )),
                  SizedBox(
                    height: 16.w,
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "+964",
                              prefixIconConstraints:
                                  BoxConstraints.tight(Size(40.w, 40.w)),
                              hintStyle: TextStyle(
                                  color: AppColors.greyColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: SvgPicture.asset(
                                svgAssets.iraq,
                                width: 20,
                                height: 20,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            enabled: false,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomTextFormField(
                          keyboardType: TextInputType.phone,
                          controller: controller.phoneController,
                          onchange: () {
                            if (_formKey.currentState!.validate()) {
                              controller.isEnabled.value = true;
                            } else {
                              controller.isEnabled.value = false;
                            } //controller.isEnabled.value = true;
                          },
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Invalid phone number (example: xxx-xxx-xxx)'
                                  .tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Phone Number".tr,
                              prefixIcon: SvgPicture.asset(
                                svgAssets.smart_phone_01,
                                width: 20,
                                height: 20,
                                fit: BoxFit.scaleDown,
                              ),
                              suffixIcon: CustomTooltip(
                                message: "Example: 123-456-7890".tr,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.w,
                  ),
                  TextField(
                    enabled: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: SvgPicture.asset(
                        svgAssets.arrow_down,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                      prefixIcon: SvgPicture.asset(
                        svgAssets.location,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: "City".tr,
                      hintStyle: TextStyle(
                        color: AppColors.GenderLabel,
                        fontSize: 12.sp,
                        fontFamily: lang_controller.fontFamily.value,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 16.w,
                  ),
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      suffixIcon: SvgPicture.asset(
                        svgAssets.arrow_down,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                      prefixIcon: SvgPicture.asset(
                        svgAssets.building_05,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.GenderLabel,
                        fontSize: 12.sp,
                        fontFamily: lang_controller.fontFamily.value,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Choose your favorite sector".tr,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 16.w,
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              // controller.isEnabled.value ? null : const Color(0xffFFD8BF),
                              controller.isEnabled.value
                                  ? null
                                  : Color(0xffFFD8BF),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Save data
                            print("Save data");
                          }
                        },
                        child: Text('Save'.tr,
                            style: TextStyle(
                                fontFamily: lang_controller.fontFamily.value,
                                fontWeight: FontWeight.w600)))),
                  ),
                  SizedBox(
                    height: 21.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: RichText(
                        text: TextSpan(
                            text: "Do you need help?".tr,
                            style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: 12.sp,
                              fontFamily: lang_controller.fontFamily.value,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                          TextSpan(text: " "),
                          TextSpan(
                            text: "Contact us".tr,
                            style: TextStyle(
                              color: AppColors.orangeColor,
                              fontSize: 12.sp,
                              fontFamily: lang_controller.fontFamily.value,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ])),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
