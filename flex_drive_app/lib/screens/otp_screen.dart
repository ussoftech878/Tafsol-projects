import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/utills/custom_colors.dart';
import 'package:flexdrive/view_models/auth_view_model.dart';
import 'package:flexdrive/view_models/exception_handling.dart';
import 'package:flexdrive/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  static const routeName = 'OtpScreen';
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: -20.w,
            left: 0,
            right: 190.w,
            child: Image.asset(
              Image_assets.splash_vector,
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
                      width: 194.w,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Enter Verification Code',
                      style: TextStyle(
                        color: AppColors.kTextBlack,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PinCodeTextField(
                      autoDisposeControllers: false,
                      controller:
                          context.read<AuthViewModel>().getotpController,
                      backgroundColor: Colors.transparent,
                      appContext: context,
                      length: 6,
                      hintCharacter: "0",
                      hintStyle: TextStyle(
                        color: const Color(0xFF7B7B7B),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      pinTheme: PinTheme(
                        inactiveFillColor: const Color(0xFFFAFAFA),
                        activeFillColor: const Color(0xFFFAFAFA),
                        inactiveColor: const Color(0xFF7B7B7B),
                        inactiveBorderWidth: 0.5.w,
                        activeBorderWidth: 0.5.w,
                        selectedBorderWidth: 0.5.w,
                        fieldHeight: 50.h,
                        fieldWidth: 50.w,
                        shape: PinCodeFieldShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      child: Consumer<AuthViewModel>(
                          builder: (_, authViewModel, __) {
                        return Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: authViewModel.isResendButtonEnabled
                                ? () {
                                    context
                                        .read<AuthViewModel>()
                                        .callSendingOtp()
                                        .then((value) => EasyLoading.showSuccess(
                                            "${authViewModel.getReSendOptRespone.message}")); // Resend OTP
                                  }
                                : null, // Disable onTap when button is disabled
                            child: Text(
                              'Resend OTP',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: authViewModel.isResendButtonEnabled
                                          ? const Color(
                                              0xFF018ABE) // Active color
                                          : Colors.grey, // Disabled color
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                      }),
                    ),
                    GradientButton(
                        text: 'Verify',
                        onPressed: () {
                          if (!context
                              .read<ExceptionHandling>()
                              .listOfAPi
                              .contains(context
                                  .read<AuthViewModel>()
                                  .verifyOTPFunction())) {
                            context.read<ExceptionHandling>().listOfAPi.add(
                                context
                                    .read<AuthViewModel>()
                                    .verifyOTPFunction);
                          }
                          context.read<AuthViewModel>().verifyOTPFunction();
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
                      return Align(
                        alignment: Alignment.center,
                        child: Text(
                          authViewModel.formattedTime != "00:00s"
                              ? "Resend OTP in ${authViewModel.formattedTime}"
                              : "Didn't receive the OTP?",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: authViewModel.isResendButtonEnabled
                                ? const Color(0xff018ABE)
                                : Colors.grey,
                          ),
                        ),
                      );
                    })
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
