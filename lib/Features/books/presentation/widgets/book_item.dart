import 'package:book_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:book_app/Core/utils/app_strings.dart';
import 'package:book_app/Features/books/domain/entities/book.dart';
import 'package:book_app/Features/books/presentation/widgets/author_item.dart';
import 'package:book_app/Features/books/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: BookImage(
            imageUrl: book.imageUrl,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: AppTextStyles.of(context).font18Bold,
              ),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: List.generate(
                  book.authors.length,
                  (index) => AuthorItem(name: book.authors[index].name),
                ),
              ),
              SizedBox(height: 10.h),
              ReadMoreText(
                book.summaries.join('\n'),
                style: AppTextStyles.of(context).font14Medium,
                trimMode: TrimMode.Line,
                trimLines: 3,
                colorClickableText: Theme.of(context).primaryColor,
                trimCollapsedText: AppStrings.seeMore,
                trimExpandedText: AppStrings.seeLess,
              ),
            ],
          ),
        )
      ],
    );
  }
}
