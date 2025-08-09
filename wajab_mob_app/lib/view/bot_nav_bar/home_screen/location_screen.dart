import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

class MapLocationScreen extends GetView<HomeScreenController> {
  static const routeName = 'MapLocationScreen';
  const MapLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 48.w,
        title: const Text(
          'Location',
        ),
        leading: InkWell(
          onTap: (){
          Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 27).w,
            child: SvgPicture.asset(
              svgAssets.backArrow,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 27.w),
            child: LanguageButton()
          )
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    imageAssets.mapBg,
                    fit: BoxFit.fitHeight,
                  //  width: 402.w,
                   // height: 550.h,
                  ),
                ),
                Positioned.fill(
                  top: 410.h,
                  child: Container(
                    // height: 0.w,
                    // width: double.infinity,
                    // width: ,
                    decoration: BoxDecoration(
                      color: AppColors.kScaffoldColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 27.w, right: 27.w, top: 26.h),
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Select Distance',
                            style: TextStyle(
                              color: const Color(0xff252525),
                              fontFamily: controller
                                  .languagecontroller.fontFamily.value,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Search for a city',
                              prefixIcon: SvgPicture.asset(
                                svgAssets.Search,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SfSlider(
                                    min: 0.0,
                                    max: 100.0,
                                    value: controller.value.value,
                                    interval: 20,
                                    // showTicks: true,
                                    // showLabels: true,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      controller.selectDistance(value.toString());
                                    },
                                  ),
                                ),
                                Text('4 km',style: TextStyle(fontSize: 15.sp,
                                    fontFamily: controller.languagecontroller.fontFamily.value),)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('Show Results')),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(svgAssets.loc),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text('Use my current location',
                                  style: TextStyle(
                                      color: AppColors.kPrimaryColor,
                                      fontSize: 14.sp,
                                      fontFamily: controller
                                          .languagecontroller.fontFamily.value,
                                      fontWeight: FontWeight.w600)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
