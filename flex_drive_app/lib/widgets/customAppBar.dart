import 'package:flexdrive/utills/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading;

  const CustomAppBar({Key? key, required this.title, required this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: ClipOval(
                child: Image.asset(
                  Image_assets
                      .backbutton, // Change this to your actual asset path
                  height: 90.h,
                  width: 90.w,
                ),
              ),
            )
          : Container(),
      title: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF161616),
          fontSize: 24.sp,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
