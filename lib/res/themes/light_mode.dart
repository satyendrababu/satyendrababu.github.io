import 'package:flutter/material.dart';

import 'input_decoration_theme.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.blue.shade300,
    primary: Colors.blue.shade500,
    secondary: Colors.blue.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.blue.shade900,

  ),
  inputDecorationTheme: lightInputDecorationTheme,
);
