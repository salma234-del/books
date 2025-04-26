import 'package:book_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:book_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthorItem extends StatelessWidget {
  const AuthorItem({
    required this.name,
    super.key,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 6.r),
      decoration: BoxDecoration(
        color: AppColors.of(context).card,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        name,
        style: AppTextStyles.of(context).font12SemiBold,
      ),
    );
  }
}
