import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/view_models/Splash_model.dart';
import 'package:flexdrive/view_models/auth_view_model.dart';
import 'package:flexdrive/view_models/exception_handling.dart';
import 'package:flexdrive/view_models/home_veiw_model.dart';
import 'package:flexdrive/view_models/navbar_model.dart';
import 'package:flexdrive/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'utills/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BottomNavModel()),
    ChangeNotifierProvider(create: (context) => SplashProvider()),
    ChangeNotifierProvider(create: (context) => AuthViewModel()),
    ChangeNotifierProvider(create: (context) => HomeVeiwModel()),
    ChangeNotifierProvider(create: (context) => ProfileVeiwModel()),
    ChangeNotifierProvider(create: (context) => ExceptionHandling())
  ], child: const MyApp()));
  // runApp() const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Flex Drive',
            debugShowCheckedModeBanner: false,
            theme: CustomTheme().lightTheme,
            navigatorKey: navigatorKey,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            builder: EasyLoading.init(),
          );
        });
  }
}
