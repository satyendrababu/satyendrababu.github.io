import 'package:flutter/material.dart';

class CustomBoxShadow {

  static List<BoxShadow> getShadow(Color primaryColor) {
    return [
      BoxShadow(
        color: primaryColor.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, 10),  // Bottom shadow
      ),
      BoxShadow(
        color: primaryColor.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(8, 0),   // Right shadow
      ),
      BoxShadow(
        color: primaryColor.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(-1, 0),  // Left shadow
      ),
    ];
  }

  static List<BoxShadow> getAppBarShadow(Color primaryColor) {
    return [
      BoxShadow(
        color: primaryColor.withOpacity(0.11),
        blurRadius: 10,
        offset: const Offset(0, 20),  // Bottom shadow
      ),

    ];
  }

}