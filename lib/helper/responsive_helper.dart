import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class ResponsiveHelper {


  static bool isWeb() {
    return kIsWeb;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 850;

  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width >= 850;


  }


  static bool isDesktop(context) {
    return MediaQuery.of(context).size.width >= 1100;

  }



  static bool isPortrait(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.landscape;
  }


  // Generic method to get padding based on device and orientation
  /*static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isWeb()) {
      return const EdgeInsets.symmetric(horizontal: 400, vertical: 30);

    } else {
      return isPortrait(context)
          ? const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
          : const EdgeInsets.symmetric(horizontal: 200, vertical: 8);
    }
  }*/
  static EdgeInsets getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    if (isWeb()) {
      // Adjust padding based on web screen size
      return EdgeInsets.symmetric(
        horizontal: width * 0.2, // Adjust as needed for large web screens
        vertical: height * 0.03,
      );
    } else {
      // For mobile screens, adapt based on orientation
      if (isPortrait(context)) {
        return EdgeInsets.symmetric(
          horizontal: width * 0.1, // For small horizontal padding on portrait
          vertical: height * 0.02,
        );
      } else {
        return EdgeInsets.symmetric(
          horizontal: width * 0.3, // For larger horizontal padding on landscape
          vertical: height * 0.015,
        );
      }
    }
  }


}