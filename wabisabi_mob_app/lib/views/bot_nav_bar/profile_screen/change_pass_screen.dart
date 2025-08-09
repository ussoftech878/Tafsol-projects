// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/my_Account_controller.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/pass_change.dart';

class ChangePassScreen extends GetView<MyAccountController> {
  static const routeName = 'ChangePassScreen';
  ChangePassScreen({super.key});
  MyAccountController controller = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Change Password'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: controller.oldController,
                  decoration: InputDecoration(
                    hintText: 'Old Password',
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Obx(
                  () => CustomTextFormField(
                    controller: controller.paswordController,
                    obscureText: !controller.isPasswordVisible.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return controller.checkPasswordStrength(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.isPasswordVisible.value =
                                !controller.isPasswordVisible.value;
                          },
                          icon: controller.isPasswordVisible.value
                              ? Icon(
                                  Icons.visibility_outlined,
                                  size: 24.sp,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  size: 24.sp,
                                )),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),
                Obx(
                  () => CustomTextFormField(
                    controller: controller.confirmPaswordController,
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required';
                      }
                      return controller.checkConfirmPassword(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.isConfirmPasswordVisible.value =
                                !controller.isConfirmPasswordVisible.value;
                          },
                          icon: controller.isConfirmPasswordVisible.value
                              ? Icon(
                                  Icons.visibility_outlined,
                                  size: 24.sp,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  size: 24.sp,
                                )),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                // **Password Match Indicator**
                Obx(() {
                  return controller.isTypingConfirmPassword.value
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controller.passwordMatchMessage.value,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: controller.passwordMatchColor.value,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : Container();
                }),
                SizedBox(
                  height: 15.h,
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (controller.paswordController.text !=
                            controller.confirmPaswordController.text) {
                          return;
                        }
                        await controller.ChangePassword().then((value) {
                          if (value) {
                            showPassChangeDialogBox(context);
                          }
                        });
                      }
                    },
                    child: Text('Change Password'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
