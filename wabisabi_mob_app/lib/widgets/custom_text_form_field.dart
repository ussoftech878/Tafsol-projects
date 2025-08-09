import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';

class CustomTextFormField extends StatefulWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
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
  final bool? readOnly;
  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
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
    this.readOnly,
    this.onTap,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hasError = false;
  bool isValid = false;
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      cursorColor: Get.find<ThemeController>().themeMode.value == ThemeMode.dark
          ? AppColors.kWhiteColor
          : AppColors.kPrimaryColor,
      controller: widget.controller,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value); // Pass the value to onchange callback
        }
        setState(() {
          isEmpty = value.isEmpty;
          isValid = widget.validator != null
              ? widget.validator!(value) == null
              : true;
          hasError = !isValid && !isEmpty;
        });
      },
      validator: (value) {
        if (widget.validator != null) {
          final error = widget.validator!(value);
          setState(() {
            hasError = error != null;
            isValid = error == null;
          });
          return error;
        }
        return null;
      },
      obscureText: widget.obscureText,
      autofocus: widget.autofocus,
      style: TextStyle(
        fontSize: 15.sp,
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
        filled: true,
        fillColor:
            //  isEmpty
            //     ? Color(0XFFF5F9FE)
            //     :
            hasError
                ? Get.find<ThemeController>().themeMode.value == ThemeMode.dark
                    ? Color(0xffA18A8A)
                    : Color(0xffFFD9D9)
                : isValid
                    ? Get.find<ThemeController>().themeMode.value ==
                            ThemeMode.dark
                        ? null
                        : Color(0xFFFFF3EE)
                    : null,
        errorStyle: TextStyle(
          fontSize: 12.sp,
          color: Colors.red,
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
