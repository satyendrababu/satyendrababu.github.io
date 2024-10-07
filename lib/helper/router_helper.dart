import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ehr/helper/responsive_helper.dart';
import 'package:simple_ehr/view/dashboard/dashboard_screen.dart';
import 'package:simple_ehr/view/main_screen.dart';
import 'package:simple_ehr/view/my_notes/my_notes_screen.dart';
import 'package:simple_ehr/view/patients/patient_details_screen.dart';
import 'package:simple_ehr/view/patients/patients_screen.dart';
import 'package:simple_ehr/view/sign_in/login_screen.dart';
import 'package:simple_ehr/view/splash/splash_screen.dart';
import 'package:simple_ehr/view/to_do/to_do_screen.dart';

import '../main.dart';



enum RouteAction{push, pushReplacement, popAndPush, pushNamedAndRemoveUntil}
class RouterHelper {

  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String mainScreen = '/main-screen';
  static const String dashBoard = '/dashboard';
  static const String patientsScreen = '/patients';
  static const String toDoScreen = '/todo';
  static const String myNotesScreen = '/my-notes';
  static const String patientDetailsScreen = '/patient-details';

  static final goRoutes = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: !ResponsiveHelper.isWeb() ? getSplashRoute() : getMainRoute(),
    routes: [
      GoRoute(path: splashScreen, builder: (context, state) => SplashScreen()),
      GoRoute(path: mainScreen, builder: (context, state) => MainScreen(
        currentPageIndex: state.uri.queryParameters['page'] == 'dashboard'
          ? 0 : state.uri.queryParameters['page'] == 'patients'
          ? 1 : state.uri.queryParameters['page'] == 'todo'
          ? 2 : state.uri.queryParameters['page'] == 'my_notes'
          ? 4 : 0,
      )),


      GoRoute(path: loginScreen, builder: (context, state) => LoginScreen()),
      GoRoute(path: dashBoard, builder: (context, state) => DashboardScreen()),
      GoRoute(path: patientsScreen, builder: (context, state) => PatientsScreen()),
      GoRoute(path: toDoScreen, builder: (context, state) => ToDoScreen()),
      GoRoute(path: myNotesScreen, builder: (context, state) => MyNotesScreen()),
      GoRoute(path: patientDetailsScreen, builder: (context, state) => PatientDetailsScreen()),


    ]
  );

  static String getSplashRoute({RouteAction? action}) {
    return _navigateRoute(splashScreen, route: action);
  }
  static String getLoginRoute({RouteAction? action}) {
    return _navigateRoute(loginScreen, route: action);
  }
  static String getMainRoute({RouteAction? action}) {
    return _navigateRoute(mainScreen, route: action);
  }
  static String getDashboardRoute({RouteAction? action}) {
    return _navigateRoute(dashBoard, route: action);
  }
  static String getPatientsRoute({RouteAction? action}) {
    return _navigateRoute(patientsScreen, route: action);
  }
  static String getToDoRoute({RouteAction? action}) {
    return _navigateRoute(toDoScreen, route: action);
  }
  static String getMyNotesRoute({RouteAction? action}) {
    return _navigateRoute(myNotesScreen, route: action);
  }
  static String getPatientDetailsRoute({RouteAction? action}) {
    return _navigateRoute(patientDetailsScreen, route: action);
  }


  static String _navigateRoute(String path, {RouteAction? route}) {
    if(route == RouteAction.pushNamedAndRemoveUntil) {
      Get.context?.go(path);
    }else if(route == RouteAction.pushReplacement) {
      Get.context?.pushReplacement(path);
    }else {
      Get.context?.push(path);
    }
    return path;
  }

  GoRouter router = GoRouter(
      routes: [
        GoRoute(
            name: 'mainScreen',
            path: '/',
          builder: (context, state) {
              return MainScreen(currentPageIndex: 0,);
          }
        ),
        GoRoute(
            name: 'dashboard',
            path: '/dashboard',
            builder: (context, state) {
              return DashboardScreen();
            }
        ),

      ]
  );
}
