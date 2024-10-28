import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_ehr/helper/responsive_helper.dart';
import 'package:simple_ehr/provider/auth_provider.dart';
import 'package:simple_ehr/view/base/not_found_screen.dart';
import 'package:simple_ehr/view/dashboard/dashboard_screen.dart';
import 'package:simple_ehr/view/forget_password/create_new_password_screen.dart';
import 'package:simple_ehr/view/forget_password/forget_password_screen.dart';
import 'package:simple_ehr/view/forget_password/verify_code_screen.dart';
import 'package:simple_ehr/view/main_screen.dart';
import 'package:simple_ehr/view/my_notes/my_notes_screen.dart';
import 'package:simple_ehr/view/patients/patient_details_screen.dart';
import 'package:simple_ehr/view/patients/patients_screen.dart';
import 'package:simple_ehr/view/profile/profile_screen.dart';
import 'package:simple_ehr/view/sign_in/login_screen.dart';
import 'package:simple_ehr/view/splash/splash_screen.dart';
import 'package:simple_ehr/view/to_do/to_do_screen.dart';

import '../main.dart';



enum RouteAction{push, pushReplacement, popAndPush, pushNamedAndRemoveUntil}
class RouterHelper {

  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String forgetPasswordScreen = '/forget-password';
  static const String verifyCodeScreen = '/verify-code';
  static const String createNewPasswordScreen = '/create-new-password';
  static const String mainScreen = '/main-screen';
  static const String profileScreen = '/profile';
  static const String dashBoard = '/dashboard';
  static const String patientsScreen = '/patients';
  static const String toDoScreen = '/todo';
  static const String myNotesScreen = '/my-notes';
  static const String patientDetailsScreen = '/patient-details';

  static final goRoutes = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: !ResponsiveHelper.isWeb() ? getSplashRoute() : getMainRoute(),
    errorBuilder: (ctx, _)=> const NotFoundScreen(),
    routes: [
      GoRoute(path: splashScreen, builder: (context, state) => const SplashScreen()),
      GoRoute(path: mainScreen, builder: (context, state) => _routeHandler(context, MainScreen(
        currentPageIndex: state.uri.queryParameters['page'] == 'dashboard'
          ? 0 : state.uri.queryParameters['page'] == 'patients'
          ? 1 : state.uri.queryParameters['page'] == 'todo'
          ? 2 : state.uri.queryParameters['page'] == 'my_notes'
          ? 4 : 0,
      ))),


      GoRoute(path: loginScreen, builder: (context, state) => const LoginScreen()),
      GoRoute(path: forgetPasswordScreen, builder: (context, state) => const ForgetPasswordScreen()),
      GoRoute(path: verifyCodeScreen, builder: (context, state) => const VerifyCodeScreen()),
      GoRoute(path: createNewPasswordScreen, builder: (context, state) => const CreateNewPasswordScreen()),


      GoRoute(path: dashBoard, builder: (context, state) => const DashboardScreen()),
      GoRoute(path: profileScreen, builder: (context, state) => const ProfileScreen()),
      GoRoute(path: patientsScreen, builder: (context, state) => PatientsScreen()),
      GoRoute(path: toDoScreen, builder: (context, state) => ToDoScreen()),
      GoRoute(path: myNotesScreen, builder: (context, state) => const MyNotesScreen()),
      GoRoute(path: patientDetailsScreen, builder: (context, state) => const PatientDetailsScreen()),


    ]
  );

  static String getSplashRoute({RouteAction? action}) {
    return _navigateRoute(splashScreen, route: action);
  }
  static String getLoginRoute({RouteAction? action}) {
    return _navigateRoute(loginScreen, route: action);
  }
  static String getForgetPasswordRoute({RouteAction? action}) {
    return _navigateRoute(forgetPasswordScreen, route: action);
  }
  static String getVerifyCodeRoute({RouteAction? action}) {
    return _navigateRoute(verifyCodeScreen, route: action);
  }
  static String getCreateNewPasswordRoute({RouteAction? action}) {
    return _navigateRoute(createNewPasswordScreen, route: action);
  }

  static String getMainRoute({RouteAction? action}) {
    return _navigateRoute(mainScreen, route: action);
  }
  static String getProfileRoute({RouteAction? action}) {
    return _navigateRoute(profileScreen, route: action);
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

  static Widget _routeHandler(BuildContext context, Widget route) {
    return !Provider.of<AuthProvider>(context, listen: false).isLoggedIn()
        ? const LoginScreen()
        : route;
  }

}
