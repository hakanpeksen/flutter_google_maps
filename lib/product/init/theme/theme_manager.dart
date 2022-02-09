import 'package:flutter/material.dart';
import 'app_colors.dart';

// https://material.io/design/typography/the-type-system.html#type-scale

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

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
