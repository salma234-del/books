import 'package:book_app/Core/global/theme/app_colors/app_dark_colors.dart';
import 'package:book_app/Core/global/theme/app_colors/app_light_colors.dart';
import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color primary;
  final Color card;
  final Color textPrimary;
  final Color textSecondary;
  final Color input;
  final Color border;
  final Color error;

  const AppColors._({
    required this.background,
    required this.primary,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
    required this.input,
    required this.border,
    required this.error,
  });

  static final AppColors light = AppColors._(
    background: backgroundLight,
    primary: primaryLight,
    card: cardLight,
    textPrimary: textPrimaryLight,
    textSecondary: textSecondaryLight,
    input: inputLight,
    border: borderLight,
    error: errorLight,
  );

  static final AppColors dark = AppColors._(
    background: backgroundDark,
    primary: primaryDark,
    card: cardDark,
    textPrimary: textPrimaryDark,
    textSecondary: textSecondaryDark,
    input: inputDark,
    border: borderDark,
    error: errorDark,
  );

  static AppColors of(BuildContext context) {
    final isDark = true; // Will be replaced with actual theme check
    // ignore: dead_code
    return isDark ? dark : light;
  }
}
