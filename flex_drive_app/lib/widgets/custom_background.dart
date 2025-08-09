import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flexdrive/utills/images.dart';

class AppLogoWithVector extends StatelessWidget {
  const AppLogoWithVector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Image_assets.splash_vector,
      width: 100.w,
    );
  }
}
