import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ehr/helper/router_helper.dart';
import 'package:simple_ehr/provider/auth_provider.dart';
import 'package:simple_ehr/provider/profile_provider.dart';
import 'package:simple_ehr/provider/splash_provider.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/view/main_screen.dart';
import 'package:simple_ehr/view/page_index_provider.dart';
import 'package:simple_ehr/view/splash/splash_screen.dart';
import 'package:url_strategy/url_strategy.dart';
import 'di_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  //DI starting point
  await di.init();
  setPathUrlStrategy();


  runApp(
      MultiProvider(
        providers: [
          
          ChangeNotifierProvider(create: (_) => PageIndexProvider()),
          ChangeNotifierProvider(create: (_) => di.sl<SplashProvider>()),
          ChangeNotifierProvider(create: (_) => di.sl<AuthProvider>()),
          ChangeNotifierProvider(create: (_) => di.sl<ProfileProvider>())
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterHelper.goRoutes,
     /* routeInformationParser: RouterHelper.goRoutes.routeInformationParser,
      routeInformationProvider: RouterHelper.goRoutes.routeInformationProvider,
      routerDelegate: RouterHelper.goRoutes.routerDelegate,*/
      title: 'Dashboard UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: mainBackgroundColor,
        brightness: Brightness.dark
      ),
      //home: const MainScreen(),
      //home: const SplashScreen(),
    );
  }
}

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}

