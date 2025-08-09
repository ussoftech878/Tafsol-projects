import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class CustomBackButtonAppBar extends GetView<Languagecontroller>
    implements PreferredSizeWidget {
  final String title;
  final bool? isBackButton;
  final List<Widget>? actionsButton;
  const CustomBackButtonAppBar(
      {super.key, required this.title, this.actionsButton, this.isBackButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 48.w,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: controller.fontFamily.value,
        ),
      ),
      leading: isBackButton == null || isBackButton == true
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 27.w),
                child: Transform.scale(
                  scaleX:
                      Directionality.of(context) == TextDirection.rtl ? -1 : 1,
                  child: SvgPicture.asset(
                    svgAssets.backArrow,
                  ),
                ),
              ),
            )
          : null,
      actions: actionsButton,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(38.h);
}
