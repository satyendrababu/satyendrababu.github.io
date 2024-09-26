import 'package:flutter/cupertino.dart';
import 'package:simple_ehr/res/colors/app_colors.dart';

class Resources {
  BuildContext _context;

  Resources(this._context);

  /*Strings get strings {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'fr':
        return FrenchStrings();
      default:
        return EnglishStrings();
    }
  }*/

  AppColors get color {
    return AppColors();
  }



  static Resources of(BuildContext context){
    return Resources(context);
  }
}