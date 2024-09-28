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
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isWeb()) {
      return const EdgeInsets.symmetric(horizontal: 400, vertical: 30);

    } else {
      return isPortrait(context)
          ? const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
          : const EdgeInsets.symmetric(horizontal: 200, vertical: 8);
    }
  }


}