import 'package:admin_panel_study_hub/logic/theme/theme_constrains.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: LightModeColors.mainColor,
    primary: LightModeColors.primaryColor,
    onPrimary: Colors.white, 
    secondary: LightModeColors.primaryColor, 
    onSecondary: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black), 
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: DarkModeColors.mainColor,
    primary: LightModeColors.primaryColor,
    onPrimary: Colors.white, 
    secondary: DarkModeColors.primaryColor, 
    onSecondary: Colors.white,
    tertiary: Colors.grey,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);