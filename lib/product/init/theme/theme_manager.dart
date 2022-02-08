import 'package:flutter/material.dart';
import 'app_colors.dart';

class ThemeManager {
  final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 70, fontWeight: FontWeight.w300),
      subtitle1: TextStyle(fontSize: 10, color: AppColors.white),
      headline4:
          TextStyle(fontSize: 14, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
      headline6:
          TextStyle(fontSize: 22, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
      caption: TextStyle(fontSize: 8, color: AppColors.mainBlue, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 8, color: AppColors.grey, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 10, color: AppColors.primaryColor),
      headline2: TextStyle(fontSize: 14, color: AppColors.white),
      headline3: TextStyle(fontSize: 12, color: AppColors.grey, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 12, color: AppColors.mainBlue, fontWeight: FontWeight.bold),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.mainBlue,
      primaryContainer: AppColors.white,
      secondary: AppColors.grey,
      surface: AppColors.azureBlue,
      background: AppColors.lightAzureBlue,
    ),
  );
}
