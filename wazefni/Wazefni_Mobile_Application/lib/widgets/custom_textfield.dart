import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';

class CustomTextFormField extends StatefulWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onchange;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final bool autofocus;
  final TextStyle? style;
  final bool enabled;
  final int? maxLength;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final InputDecoration? decoration;
  final TextCapitalization textCapitalization;
  final bool isPassword;

  CustomTextFormField({
    Key? key,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onchange,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.autofocus = false,
    this.style,
    this.enabled = true,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.decoration,
    this.textCapitalization = TextCapitalization.none,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool hasError;
  final Languagecontroller langController = Get.put(Languagecontroller());
  @override
  void initState() {
    super.initState();
    hasError = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: (value) {
        if (widget.onchange != null) {
          widget.onchange!();
        }
      },
      validator: (value) {
        if (widget.validator != null) {
          final error = widget.validator!(value);
          setState(() {
            hasError = error != null;
          });
          return error;
        }
        return null;
      },
      obscureText: widget.obscureText,
      autofocus: widget.autofocus,
      style: TextStyle(
        color: widget.controller?.text.isEmpty ?? false
            ? Theme.of(context).textTheme.bodyMedium!.color
            : hasError
                ? Color(0xffCF1322)
                : Color(0xff389E0D),
        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
        fontWeight: widget.style?.fontWeight,
      ),
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textCapitalization: widget.textCapitalization,
      decoration: widget.decoration?.copyWith(
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.GenderLabel,
          fontSize: 12.sp,
          fontFamily: langController.fontFamily.value,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        suffixIcon: widget.isPassword
            ? null
            : hasError
                ? SvgPicture.asset(
                    svgAssets.emailWarning,
                    fit: BoxFit.scaleDown,
                    width: 20.w,
                  )
                : widget.controller?.text.isNotEmpty ?? false
                    ? SvgPicture.asset(
                        svgAssets.emailApproved,
                        fit: BoxFit.scaleDown,
                        width: 20.w,
                      )
                    : null,
        fillColor: widget.controller?.text.isEmpty ?? false
            ? null
            : hasError
                ? Color(0xffFFF1F0)
                : Color(0xffF6FFED),
        errorStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
            fontFamily: 'Almarai'),
      ),
    );
  }
}
