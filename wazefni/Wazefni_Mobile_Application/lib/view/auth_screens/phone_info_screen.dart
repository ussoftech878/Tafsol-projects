import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/controllers/PhoneInfoScreen_controller.dart';
import 'package:wazefni_iraq/widgets/custom_textfield.dart';

import '../../controllers/EmailInfoScreen_controller.dart';
import '../../controllers/LanguageController.dart';
import '../../widgets/tooltip.dart';

class PhoneInfoScreen extends StatefulWidget {
  static const routeName = 'PhoneInfoScreen';
  const PhoneInfoScreen({super.key});

  @override
  State<PhoneInfoScreen> createState() => _PhoneInfoScreenState();
}

class _PhoneInfoScreenState extends State<PhoneInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  //PhoneinfoscreenController controller = Get.put(PhoneinfoscreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/png/seekerImage.png",
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
              child: info())
        ],
      ),
    );
    ;
  }
}

class info extends StatelessWidget {
  const info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Languagecontroller lang_controller = Get.put(Languagecontroller());
    PhoneinfoscreenController _controller =
        Get.put(PhoneinfoscreenController());
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.all(16.w),
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
            Text('Add a professional profile picture to best represent you'.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 12.sp,
                    fontFamily: lang_controller.fontFamily.value,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 24.w,
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          svgAssets.avatar,
                          width: 72.w,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              // Handle profile picture selection
                              print("Add profile picture");
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: AppColors.orangeColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    Text(
                      'Profile Picture'.tr,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 12.sp,
                        fontFamily: lang_controller.fontFamily.value,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 28.w,
            ),
            Text(
              'Enter your personal information'.tr,
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
              textAlign: TextAlign.center,
              'Enter data accurately for a unique and precise experience.'.tr,
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
                        controller: _controller.DOBController,
                        validator: (value) {
                          if (GetUtils.isBlank(value)!) {
                            return 'Please enter your date of birth'.tr;
                          }
                          return null;
                        },
                        onchange: () {
                          if (_formKey.currentState!.validate()) {
                            _controller.isEnabled.value = true;
                          } else {
                            _controller.isEnabled.value = false;
                          } //controller.isEnabled.value = true;
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: AppColors.GenderLabel,
                            fontSize: 12.sp,
                            fontFamily: lang_controller.fontFamily.value,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: "Date of Birth".tr,
                          border: const OutlineInputBorder(),
                          prefixIcon: SvgPicture.asset(
                            width: 20,
                            height: 20,
                            svgAssets.user,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 16.w,
                  ),
                  CustomTextFormField(
                    controller: _controller.emailController,
                    onchange: () {
                      if (_formKey.currentState!.validate()) {
                        _controller.isEnabled.value = true;
                      } else {
                        _controller.isEnabled.value = false;
                      } //controller.isEnabled.value = true;
                    },
                    validator: (value) {
                      if (GetUtils.isNullOrBlank(value)!) {
                        return 'Invalid email address (example: example@email.com)'
                            .tr;
                        //+"(مثال: example@email.com)".tr;
                      } else if (!GetUtils.isEmail(value.toString())) {
                        return 'Invalid email address (example: example@email.com)'
                            .tr;
                        //+"(مثال: example@email.com)".tr;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Mail".tr,
                      border: const OutlineInputBorder(),
                      prefixIcon: SvgPicture.asset(
                        svgAssets.mail_01,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                      suffixIcon: CustomTooltip(
                        message: "Example: example@email.com".tr,
                      ),
                    ),
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
                        height: 20.w,
                        fit: BoxFit.scaleDown,
                      ),
                      prefixIcon: SvgPicture.asset(
                        svgAssets.location,
                        height: 20.w,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: "City".tr,
                      hintStyle: TextStyle(
                        fontFamily: lang_controller.fontFamily.value,
                        color: AppColors.GenderLabel,
                        fontSize: 12.sp,
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
                      hintText: "Choose your favorite sector".tr,
                      hintStyle: TextStyle(
                        fontFamily: lang_controller.fontFamily.value,
                        color: AppColors.GenderLabel,
                        fontSize: 12.sp,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 16.w,
                  ),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller.isMale.value = true;
                              _controller.isFemale.value = false;
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  svgAssets.Male,
                                  width: 32.66.w,
                                ),
                                Text("Male".tr,
                                    style: TextStyle(
                                      color: _controller.isMale.value
                                          ? AppColors.orangeColor
                                          : AppColors.GenderLabel,
                                      fontSize: 16.sp,
                                      fontFamily:
                                          lang_controller.fontFamily.value,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 48.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              _controller.isMale.value = false;
                              _controller.isFemale.value = true;
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  svgAssets.Female,
                                  width: 32.66.w,
                                ),
                                Text("Female".tr,
                                    style: TextStyle(
                                      color: _controller.isFemale.value
                                          ? AppColors.orangeColor
                                          : AppColors.GenderLabel,
                                      fontSize: 16.sp,
                                      fontFamily:
                                          lang_controller.fontFamily.value,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 12.w,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _controller.isEnabled.value
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
                                fontFamily:
                                    lang_controller.fontFamily.value)))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
