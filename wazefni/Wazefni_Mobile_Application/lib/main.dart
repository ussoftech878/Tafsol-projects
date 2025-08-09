import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/routes.dart';
import 'package:wazefni_iraq/constants/theme.dart';
import 'package:wazefni_iraq/services/LanguageServices.dart';
import 'package:wazefni_iraq/view/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            title: 'Wazuff',
            debugShowCheckedModeBanner: false,
            theme: CustomTheme().lightTheme,
            initialRoute: Splash.routeName,
            translations: TranslationService(),
            locale: const Locale('en', 'US'), // Initial locale
            fallbackLocale: const Locale('en', 'US'),
            onGenerateRoute: Pages.onGenerateRoute,
            defaultTransition: Transition.rightToLeft,
            smartManagement: SmartManagement.full,
          );
        });
  }
}
