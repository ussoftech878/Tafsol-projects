import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/routes.dart';
import 'package:wajba_mobile_app/constants/theme.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/services/language_service.dart';
import 'package:wajba_mobile_app/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  // Initialize GetX
  Get.put(Languagecontroller());
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  // Run the app
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      ensureScreenSize: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Wajba',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: SplashScreen.routeName,
          translations: TranslationService(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          onGenerateRoute: Pages.onGenerateRoute,
          defaultTransition: Transition.rightToLeft,
          smartManagement: SmartManagement.full,
        );
      },
    );
  }
}
