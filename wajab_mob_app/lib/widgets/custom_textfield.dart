import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

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
  final bool readOnly;

  const CustomTextFormField(
      {super.key,
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
      this.readOnly = true});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool hasError;
  final FocusNode _focusNode = FocusNode();
  final Languagecontroller controller = Get.put(Languagecontroller());
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    hasError = false;

    // Listen to focus changes
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose of FocusNode to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.only(bottom: 35.0.h),
      readOnly: widget.readOnly,
      focusNode: _focusNode,
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
        fontFamily: controller.fontFamily.value,
        color: hasError
            ? const Color(0xffCF1322)
            : Theme.of(context).textTheme.bodyMedium!.color,
        fontSize: 14.sp,
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
          color: const Color(0xffB3B3B3), // Default hint text color
          fontSize: 14.sp,
          fontFamily: controller.fontFamily.value,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: _isFocused
            ? AppColors.kScaffoldColor // Fill color when focused
            : const Color(0xFFEBEBEB), // Default fill color
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFE2E5E8), // Border color when not focused
            ),
            borderRadius: BorderRadius.circular(11)),
        /* focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.forestColor,
            width: 1.5// Border color when focused
          ),
          borderRadius: BorderRadius.circular(10),
        ),*/
        /*  contentPadding:
        EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),*/

        errorStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
          fontFamily: controller.fontFamily.value,
        ),
      ),
    );
  }
}
