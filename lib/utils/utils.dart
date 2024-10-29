import 'package:flutter/material.dart';

import 'images.dart';

class Utils {

  static String capitalize(String? text) {
    if (text == null || text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static double setAverageRating(List<int> ratings) {
    var avgRating = 0;
    for (int i = 0; i < ratings.length; i++) {
      avgRating = avgRating + ratings[i];
    }
    return double.parse((avgRating / ratings.length).toStringAsFixed(1));
  }

  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  /*static String formatDateAndTime(String data) {
    DateTime dateTime = DateTime.parse(data).toLocal();
    return DateFormat('MM-dd-yyyy, hh:mm a').format(dateTime);
  }

  static String formatDate(String data) {
    // Format the date as "12-14-2023"
    DateTime dateTime = DateTime.parse(data);
    return DateFormat('MM-dd-yyyy').format(dateTime);
  }

  static String formatTime(String data) {
    // Format the time as "02:23 PM"
    DateTime dateTime = DateTime.parse(data);
    return DateFormat('hh:mm a').format(dateTime);
  }*/

  static String getMedicineIconType(String input) {
    List<String> parts = input.split('@');
    return parts[0];
  }

  static String getMedicineIcon(String input) {
    List<String> parts = input.split('@');
    return parts[1];
  }

  static Color getCapsuleFirst(String input) {
    List<String> parts1 = input.split('@');
    List<String> parts = parts1[1].split(':');
    return Color(int.parse(parts[0].substring(1), radix: 16) + 0xFF000000);

  }

  static Color getCapsuleSecond(String input) {
    List<String> parts1 = input.split('@');
    if (parts1[1].contains(':')) {
      List<String> parts = parts1[1].split(':');
      return Color(int.parse(parts[1].substring(1), radix: 16) + 0xFF000000);
    } else {
      return Colors.white;
    }
  }

  static Color getColorFromHex(String hexColorValue) {
    return Color(hexColorValue as int);
  }
  /*static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.unitedKingdom, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: Images.arabic, languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
    LanguageModel(imageUrl: Images.bd, languageName: 'Bengali', countryCode: 'BD', languageCode: 'bn'),
    LanguageModel(imageUrl: Images.india, languageName: 'Hindi', countryCode: 'IN', languageCode: 'hi'),
    LanguageModel(imageUrl: Images.spain, languageName: 'Spanish', countryCode: 'ES', languageCode: 'es'),
  ];*/
}
