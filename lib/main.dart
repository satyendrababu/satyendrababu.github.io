import 'package:flutter/material.dart';
import 'package:simple_ehr/helper/router_helper.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/view/main_screen.dart';
import 'package:simple_ehr/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: RouterHelper().router.routeInformationParser,
      routeInformationProvider: RouterHelper().router.routeInformationProvider,
      routerDelegate: RouterHelper().router.routerDelegate,
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

