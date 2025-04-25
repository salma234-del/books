import 'package:flutter/material.dart';
import 'package:book_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  final TextStyle font18Bold;
  final TextStyle font18Medium;
  final TextStyle font10SemiBold;

  AppTextStyles({
    required this.font18Bold,
    required this.font18Medium,
    required this.font10SemiBold,
  });

  static AppTextStyles of(BuildContext context) {
    final colors = AppColors.of(context);

    return AppTextStyles(
      font18Bold: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
      ),
      font18Medium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: colors.textPrimary,
      ),
      font10SemiBold: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        color: colors.textSecondary,
      ),
    );
  }
}
