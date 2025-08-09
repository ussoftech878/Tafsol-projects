import 'package:flexdrive/main.dart';
import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/utills/custom_colors.dart';

import 'package:flexdrive/screens/password_changed_screen.dart';
import 'package:flexdrive/view_models/auth_view_model.dart';
import 'package:flexdrive/view_models/exception_handling.dart';

import 'package:flexdrive/widgets/gradient_button.dart';
import 'package:flexdrive/widgets/user_form_field_widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = 'ForgotPasswordScreen';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0.w,
            left: 0,
            right: 180.w,
            child: Image.asset(
              alignment: Alignment.bottomLeft,
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
                      height: 91.w,
                    ),
                    Image.asset(
                      Image_assets.splash_logo,
                      width: 194.w,
                      height: 37.w,
                    ),
                    SizedBox(
                      height: 31.w,
                    ),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: AppColors.kTextBlack,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
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
                    const EmailTextField(),
                    SizedBox(
                      height: 30.h,
                    ),
                    GradientButton(
                        text: 'Send',
                        onPressed: () {
                          if (context.read<AuthViewModel>().emailValidation()) {
                            if (!context
                                .read<ExceptionHandling>()
                                .listOfAPi
                                .contains(context
                                    .read<AuthViewModel>()
                                    .forgotPasswordFuntion)) {
                              context.read<ExceptionHandling>().listOfAPi.add(
                                  context
                                      .read<AuthViewModel>()
                                      .forgotPasswordFuntion);
                            }
                            context
                                .read<AuthViewModel>()
                                .forgotPasswordFuntion();
                          }
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
