import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/utills/custom_colors.dart';

import 'package:flexdrive/view_models/auth_view_model.dart';
import 'package:flexdrive/view_models/exception_handling.dart';
import 'package:flexdrive/widgets/customAppBar.dart';
import 'package:flexdrive/widgets/user_form_field_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../widgets/gradient_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  static const routeName = "UpdatePasswordScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Change Password", leading: true),
      body: Stack(
        children: [
          Positioned(
            bottom: -10.w,
            left: 0,
            right: 180.w,
            child: Image.asset(
              Image_assets.splash_vector,
              width: 290.w,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Current Password',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.kTextBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.w,
                    ),
                    const CurrentPasswordTextField(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.kTextBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.w,
                    ),
                    const PasswordTextField(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Confirm Password',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.kTextBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.w,
                    ),
                    const ConfirmPasswordTextField(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Consumer<AuthViewModel>(
                        builder: (context, authViewModel, _) {
                      return GradientButton(
                          text: 'Save',
                          onPressed: () {
                            if (authViewModel.updatePasswordValidation()) {
                              if (!context
                                  .read<ExceptionHandling>()
                                  .listOfAPi
                                  .contains(authViewModel.updatePasswordFunction)) {
                                context
                                    .read<ExceptionHandling>()
                                    .listOfAPi
                                    .add(authViewModel.updatePasswordFunction);
                              }
                              authViewModel.updatePasswordFunction();
                                  
                            }
                          });
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
