import 'package:book_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDarkTheme {
  static ThemeData getTheme(BuildContext context) {
    final colors = AppColors.of(context);

    return ThemeData(
      fontFamily: GoogleFonts.urbanist().fontFamily,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colors.background,
      primaryColor: colors.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
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
