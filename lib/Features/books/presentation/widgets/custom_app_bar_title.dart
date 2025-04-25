import 'package:book_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:book_app/Core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.book_outlined,
          color: Theme.of(context).primaryColor,
          size: 24.sp,
        ),
        SizedBox(width: 8.w),
        Text(
          AppStrings.appName[0],
          style: AppTextStyles.of(context)
              .font18Bold
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        Text(
          AppStrings.appName.substring(1),
          style: AppTextStyles.of(context).font18Bold,
        ),
      ],
    );
  }
}
