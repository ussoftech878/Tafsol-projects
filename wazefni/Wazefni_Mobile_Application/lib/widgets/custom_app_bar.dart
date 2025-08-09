import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';

AppBar MyAppBar({required String title, required Function() onPressed}) {
  Languagecontroller langController = Get.put(Languagecontroller());
  return AppBar(
    title: Text(
      title,
      textDirection: TextDirection.ltr,
    ),
    leading: IconButton(
        color: const Color(0xFF141414),
        onPressed: onPressed,
        icon: langController.language.value == "en"
            ? SvgPicture.asset(svgAssets.arrowLeft)
            : SvgPicture.asset(svgAssets.arrowRight)),
  );
}
