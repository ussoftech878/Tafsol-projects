import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/widgets/inbox_tile.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = 'ChatScreen';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Inbox'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Color(0xffCBC3C3)),
                    suffixIcon: SvgPicture.asset(
                      svgAssets.seacrh,
                      fit: BoxFit.scaleDown,
                    )),
              ),
              SizedBox(height: 30.h),
              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                return InboxTile();
              }))
            ],
          ),
        ),
      ),
    );
  }
}
