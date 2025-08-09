import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class LanguageButton extends StatelessWidget {
  Languagecontroller languagecontroller = Get.put(Languagecontroller());
  LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          languagecontroller.toggleLanguage();
        },
        child: SvgPicture.asset(
          svgAssets.global,
          width: 24.w,
        ));
  }
}
