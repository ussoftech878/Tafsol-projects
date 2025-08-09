import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wajba_mobile_app/constants/assets.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onChanged;
  final double size;
  final Color checkedColor;
  final Color uncheckedColor;
  final Widget? icon; // Optional icon for checked state

  const CustomCheckbox({
    super.key,
    this.initialValue = false,
    required this.onChanged,
    this.size = 20.0,
    this.checkedColor = Colors.green,
    this.uncheckedColor = Colors.grey,
    this.icon,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
    widget.onChanged(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCheckbox,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: isChecked ? widget.checkedColor : widget.uncheckedColor,
          borderRadius: BorderRadius.circular(6.0.r),
          border: Border.all(
            color: isChecked ? widget.checkedColor : const Color(0xffE2E5E8),
            width: 1.5,
          ),
        ),
        child: isChecked
            ? Center(
                child: widget.icon ??
                    SvgPicture.asset(
                      svgAssets.checksvg,
                      height: 9.h,
                    ))
            : null,
      ),
    );
  }
}
