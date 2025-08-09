import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/widgets/fav_tile.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = 'FavoritesScreen';
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(size: 24.h),
          forceMaterialTransparency: true,
          centerTitle: false,
          title: const Text('Favourites'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle:
                        TextStyle(color: Color(0xffCBC3C3), fontSize: 14.sp),
                    suffixIcon: SvgPicture.asset(
                      svgAssets.seacrh,
                      fit: BoxFit.scaleDown,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(child: ListView.builder(
                  // itemCount: 10,
                  itemBuilder: (context, index) {
                return FavTile();
              }))
            ],
          ),
        ),
      ),
    );
  }
}
