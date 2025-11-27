import 'package:flutter/material.dart';
import 'package:news/core/utils/color_manager.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      foregroundColor: ColorManager.blackBackgroundColor,
    ),
    scaffoldBackgroundColor: ColorManager.lightBackgroundColor,
    colorScheme: ColorScheme.light(primary: ColorManager.blackBackgroundColor),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorManager.blackBackgroundColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: ColorManager.lightBackgroundColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      labelLarge: TextStyle(
        color: ColorManager.blackBackgroundColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: ColorManager.blackBackgroundColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: ColorManager.greyColor,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      foregroundColor: ColorManager.lightBackgroundColor,
    ),
    scaffoldBackgroundColor: ColorManager.blackBackgroundColor,
    colorScheme: ColorScheme.light(primary: ColorManager.lightBackgroundColor),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorManager.lightBackgroundColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: ColorManager.lightBackgroundColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      labelLarge: TextStyle(
        color: ColorManager.lightBackgroundColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: ColorManager.lightBackgroundColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: ColorManager.greyColor,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    ),
  );
}
