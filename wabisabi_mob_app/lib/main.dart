import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/routes.dart';
import 'package:wabisabi_mob_app/constants/theme.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/services/auth_services.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/banking_information_screen.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/declaration&confirmation_screen.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/financial_&_proffessional_screen.dart';

import 'package:wabisabi_mob_app/views/splash_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthService());
  Get.put(ThemeController());
  configLoading();
  runApp(const MainApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Obx(() {
            final themeController = Get.find<ThemeController>();
            return GetMaterialApp(
              builder: EasyLoading.init(),
              title: 'wabisabi',
              debugShowCheckedModeBanner: false,
              themeMode: themeController.themeMode.value,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              initialRoute: SplashScreen.routeName,
              onGenerateRoute: Pages.onGenerateRoute,
              defaultTransition: Transition.rightToLeft,
              smartManagement: SmartManagement.full,
            );
          });
        });
  }
}
