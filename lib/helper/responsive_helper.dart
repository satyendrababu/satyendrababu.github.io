import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class ResponsiveHelper {


  static bool isMobilePhone() {
    if (!kIsWeb) {
      return true;
    }else {
      return false;
    }
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static bool isMobile(context) {
    final size = MediaQuery.of(context).size.width;
    if (size < 650 || !kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isTablet(context) {
    final size = MediaQuery.of(context).size.width;

    if (size < 1100 && size >= 650) {
      return true;
    } else {
      return false;
    }
  }


  static bool isDesktop(context) {
    final size = MediaQuery.of(context).size.width;

    if (size >= 1100) {
      return true;
    } else {
      return false;
    }
  }
  /*static bool isDesktop(context) {
    final size = MediaQuery.of(context).size.width;

    if (size >= 1100) {
      return true;
    } else {
      return false;
    }
  }
  static bool isTablet(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= 600 && screenWidth < 1200;
  }

  static bool isWeb(BuildContext context) {
    *//*final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= 1200;*//*
    return kIsWeb;
  }*/

  static bool isPortrait(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.landscape;
  }
  // Generic method to get padding based on device and orientation
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isWeb()) {
      return const EdgeInsets.symmetric(horizontal: 400, vertical: 30);

    } else {
      return isPortrait(context)
          ? const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
          : const EdgeInsets.symmetric(horizontal: 200, vertical: 8);
    }
  }

  // Generic method to get margin based on device and orientation
  static EdgeInsets getResponsiveMargin(BuildContext context) {
    if (isTablet(context)) {
      return isPortrait(context)
          ? const EdgeInsets.symmetric(horizontal: 30, vertical: 15)
          : const EdgeInsets.symmetric(horizontal: 50, vertical: 10);
    } else if (isWeb()) {
      return isPortrait(context)
          ? const EdgeInsets.symmetric(horizontal: 70, vertical: 20)
          : const EdgeInsets.symmetric(horizontal: 90, vertical: 15);
    } else {
      // Mobile
      return isPortrait(context)
          ? const EdgeInsets.symmetric(horizontal: 15, vertical: 8)
          : const EdgeInsets.symmetric(horizontal: 25, vertical: 6);
    }
  }
}