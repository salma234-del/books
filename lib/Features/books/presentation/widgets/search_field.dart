import 'package:book_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:book_app/Core/utils/app_strings.dart';
import 'package:book_app/Features/books/presentation/cubits/get_books/get_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetBooksCubit>();
    return TextField(
      decoration: InputDecoration(
        isDense: true,
        hintText: AppStrings.searchBooks,
        hintStyle: AppTextStyles.of(context).font14Medium,
        suffixIcon: Icon(
          Icons.search,
          size: 24.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      onChanged: (value) {
        // Get all books again when search become empty
        if (value.isEmpty && (cubit.query?.trim().isNotEmpty ?? false)) {
          cubit.searchBooks(null, true);
        }
      },
      onSubmitted: (value) => cubit.searchBooks(value),
    );
  }
}
