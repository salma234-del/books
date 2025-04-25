import 'package:flutter/material.dart';
import 'package:book_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  final TextStyle font18Bold;
  final TextStyle font14Regular;
  final TextStyle font12SemiBold;

  AppTextStyles({
    required this.font18Bold,
    required this.font14Regular,
    required this.font12SemiBold,
  });

  static AppTextStyles of(BuildContext context) {
    final colors = AppColors.of(context);


    return AppTextStyles(
      font18Bold: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
      ),
      font14Regular: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: colors.textPrimary,
      ),
      font12SemiBold: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: colors.textSecondary,
      ),
    );
  }
}
