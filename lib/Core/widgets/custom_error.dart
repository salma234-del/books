import 'package:book_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:book_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:book_app/Core/utils/app_strings.dart';
import 'package:book_app/Features/books/presentation/cubits/get_books/get_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomError extends StatelessWidget {
  final String message;

  const CustomError({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.of(context).error,
              size: 48.sp,
            ),
            SizedBox(height: 12.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.of(context).font14Medium,
            ),
            SizedBox(height: 16.h),
            ElevatedButton.icon(
              onPressed: () {
                context.read<GetBooksCubit>().getBooks();
              },
              icon: Icon(Icons.refresh),
              label: Text(AppStrings.retry),
            ),
          ],
        ),
      ),
    );
  }
}
