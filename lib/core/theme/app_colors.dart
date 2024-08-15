import 'package:flutter/material.dart';

class AppColors {
  // Global
  static const Color primary = Color(0xFF007AFF);
  static const Color primaryAlt = Color(0xFF3F9BFF);
  static const Color secondary = Color(0xFFE5F2FF);
  static const Color secondaryAlt = Color(0xFFA6FFFA);
  static const Color background = Color(0xFFFFFFFF);
  static const Color success = Color(0xFF38AD49);
  static const Color failed = Color(0xFFE22953);
  static const Color borderDivider = Color(0xFFF2F2F2);
  static const Color bodyPrimary = Color(0xFF131313);
  static const Color bodyOnPrimary = Color(0xFFFFFFFF);
  static const Color bodySecondary = Color(0xFFD7D7D7);
  static const Color yellow = Color(0xFFFFC962);

  static const ColorScheme colorSchemeLight = ColorScheme.light(
    background: AppColors.background,
    primary: AppColors.primary,
    onPrimary: AppColors.bodyOnPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.bodySecondary,
  );
}
