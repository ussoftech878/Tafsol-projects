import 'package:flexdrive/utills/images.dart';
import 'package:flexdrive/widgets/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flexdrive/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48.h,
          child: TextFormField(
            controller: context.read<AuthViewModel>().getemailController,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding:
                  // EdgeInsets.only(top: 15.5.h, bottom: 16.5.h, left: 22.w),

                  EdgeInsets.symmetric(vertical: 15.5.h, horizontal: 22.w),
              hintText: "Email Address",
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Visibility(
              visible:
                  context.read<AuthViewModel>().getemailFieldError.isNotEmpty,
              child: red14w400(
                  data: context.read<AuthViewModel>().getemailFieldError)),
        ),
      ],
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authviewmodel, __) {
      return Column(
        children: [
          SizedBox(
            height: 48.h,
            child: TextFormField(
              obscureText: authviewmodel.getsecurePassword,
              controller: authviewmodel.getPasswordController,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  child: SvgPicture.asset(
                      height: 24.h,
                      width: 18.w,
                      fit: BoxFit.scaleDown,
                      SvgAssets.eye),
                  onTap: () {
                    authviewmodel.setSecurePassword();
                  },
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.5.h, horizontal: 22.h),
                hintText: "Password",
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
                visible: authviewmodel.getpasswordFieldError.isNotEmpty,
                child: red14w400(data: authviewmodel.getpasswordFieldError)),
          ),
        ],
      );
    });
  }
}

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authviewmodel, __) {
      return Column(
        children: [
          SizedBox(
            height: 48.h,
            child: TextFormField(
              obscureText: authviewmodel.getSecureConfrimPassword,
              controller: authviewmodel.getConfirmPasswordController,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  child: SvgPicture.asset(fit: BoxFit.scaleDown, SvgAssets.eye),
                  onTap: () {
                    authviewmodel.setSecureConfrimPassword();
                  },
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.5.h, horizontal: 22.h),
                hintText: "Confirm Password",
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
                visible: authviewmodel.getConfirmPasswordFieldError.isNotEmpty,
                child: red14w400(
                    data: authviewmodel.getConfirmPasswordFieldError)),
          ),
        ],
      );
    });
  }
}

class CurrentPasswordTextField extends StatelessWidget {
  const CurrentPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authviewmodel, __) {
      return Column(
        children: [
          SizedBox(
            height: 48.h,
            child: TextFormField(
              obscureText: authviewmodel.getSecureCurrentPassword,
              controller: authviewmodel.getcurrrentPasswordController,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  child: SvgPicture.asset(fit: BoxFit.scaleDown, SvgAssets.eye),
                  onTap: () {
                    authviewmodel.setSecureCurrentPassword();
                  },
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.5.h, horizontal: 22.h),
                hintText: "Current Password",
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
                visible: authviewmodel.getcurrrentPasswordFieldError.isNotEmpty,
                child: red14w400(
                    data: authviewmodel.getcurrrentPasswordFieldError)),
          ),
        ],
      );
    });
  }
}
