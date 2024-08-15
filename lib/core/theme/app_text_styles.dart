import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle _base({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.bodyPrimary,
    double letterSpacing = 0.0,
    double? height,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: 'SF Pro Text',
        color: color,
        decoration: decoration,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        locale: const Locale('en', 'EN'),
        textBaseline: TextBaseline.alphabetic,
      );

  static TextTheme mainTextTheme = TextTheme(
    displayLarge: headlineLarge(),
    displayMedium: headlineMedium(),
    displaySmall: headlineSmall(),
    titleLarge: titleLarge(),
    titleMedium: titleMedium(),
    titleSmall: titleSmall(),
    labelLarge: labelLarge(),
    labelMedium: labelMedium(),
    labelSmall: labelSmall(),
    bodyLarge: bodyLarge(),
    bodyMedium: bodyMedium(),
    bodySmall: bodySmall(),
  );

  static TextStyle titleLarge({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      _base(
        color: color,
        fontSize: 24,
        fontWeight: fontWeight,
        height: 32 / 24,
        letterSpacing: -0.3,
      );

  static TextStyle titleMedium({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      _base(
        color: color,
        fontSize: 20,
        fontWeight: fontWeight,
        height: 24 / 20,
        letterSpacing: -0.3,
      );

  static TextStyle titleSmall({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      _base(
        color: color,
        fontSize: 18,
        fontWeight: fontWeight,
        height: 24 / 18,
        letterSpacing: -0.3,
      );

  static TextStyle titleExtraSmall({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      _base(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
        height: 20 / 16,
        letterSpacing: -0.3,
      );

  static TextStyle headlineLarge({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      _base(
        color: color,
        fontSize: 40,
        fontWeight: fontWeight,
        height: 48 / 40,
        letterSpacing: -0.3,
      );

  static TextStyle headlineMedium({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      _base(
        color: color,
        fontSize: 32,
        fontWeight: fontWeight,
        height: 40 / 32,
        letterSpacing: -0.3,
      );

  static TextStyle headlineSmall({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      _base(
        color: color,
        fontSize: 24,
        fontWeight: fontWeight,
        height: 32 / 24,
        letterSpacing: -0.3,
      );

  static TextStyle headlineExtraSmall({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      _base(
        color: color,
        fontSize: 20,
        fontWeight: fontWeight,
        height: 24 / 20,
        letterSpacing: -0.3,
      );

  static TextStyle labelLarge({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w600,
  }) =>
      _base(
        color: color,
        fontSize: 20,
        fontWeight: fontWeight,
        height: 24 / 20,
        letterSpacing: -0.4,
      );

  static TextStyle labelMedium({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w600,
  }) =>
      _base(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
        height: 20 / 16,
        letterSpacing: -0.4,
      );

  static TextStyle labelSmall({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w600,
  }) =>
      _base(
        color: color,
        fontSize: 14,
        fontWeight: fontWeight,
        height: 20 / 14,
        letterSpacing: -0.4,
      );

  static TextStyle labelExtraSmall({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w600,
  }) =>
      _base(
        color: color,
        fontSize: 10,
        fontWeight: fontWeight,
        height: 16 / 10,
        letterSpacing: -0.4,
      );

  static TextStyle bodyLarge({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        color: color,
        fontSize: 20,
        fontWeight: fontWeight,
        height: 24 / 20,
        letterSpacing: -0.3,
      );

  static TextStyle bodyMedium({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
        height: 20 / 16,
        letterSpacing: -0.3,
      );

  static TextStyle bodySmall({
    Color color = AppColors.bodyPrimary,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        color: color,
        fontSize: 14,
        fontWeight: fontWeight,
        height: 20 / 14,
        letterSpacing: -0.3,
      );
}
