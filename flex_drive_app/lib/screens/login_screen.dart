import 'package:flexdrive/main.dart';
import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/utills/custom_colors.dart';
import 'package:flexdrive/view_models/auth_view_model.dart';
import 'package:flexdrive/view_models/exception_handling.dart';
import 'package:flexdrive/widgets/gradient_button.dart';
import 'package:flexdrive/widgets/user_form_field_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authviewmodel, __) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 190.w,
              child: Image.asset(
                alignment: Alignment.bottomLeft,
                Image_assets.splash_vector,
                width: 290.w,
                height: 265.h,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 105.h,
                      ),
                      Image.asset(
                        Image_assets.splash_logo,
                        width: 194.97.w,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Welcome Back To FlexDrive',
                        style: TextStyle(
                          color: AppColors.kTextColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.kTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      EmailTextField(),
                      SizedBox(height: 15.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.kTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      const PasswordTextField(),
                      TextButton(
                        onPressed: () {
                          authviewmodel.clearFieldsData();
                          Navigator.pushNamed(context, forgotPasswordRoute);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: AppColors.kTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      GradientButton(
                          text: 'Login',
                          onPressed: () {
                            if (authviewmodel.signInValidation()) {
                              if (!context
                                  .read<ExceptionHandling>()
                                  .listOfAPi
                                  .contains(authviewmodel.logInFunction)) {
                                context
                                    .read<ExceptionHandling>()
                                    .listOfAPi
                                    .add(authviewmodel.logInFunction);
                              }

                              authviewmodel.logInFunction();
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
    });
  }
}
