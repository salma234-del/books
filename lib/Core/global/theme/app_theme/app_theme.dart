import 'package:book_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    final colors = AppColors.of(context);

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.background,
      primaryColor: colors.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
      ),
      cardColor: colors.card,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colors.input,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.border),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final colors = AppColors.of(context);

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colors.background,
      primaryColor: colors.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
      ),
      cardColor: colors.card,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colors.input,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.border),
        ),
      ),
    );
  }
}
