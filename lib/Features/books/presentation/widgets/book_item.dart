import 'package:book_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:book_app/Core/utils/app_strings.dart';
import 'package:book_app/Features/books/presentation/widgets/author_item.dart';
import 'package:book_app/Features/books/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: BookImage(
            imageUrl:
                'https://www.gutenberg.org/cache/epub/84/pg84.cover.medium.jpg',
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Harry Potter and the Deathly Hallows',
                style: AppTextStyles.of(context).font18Bold,
              ),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  AuthorItem(
                    name: 'salma ahmed',
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ReadMoreText(
                'Flutter is Google’s mobile UI open source frammmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                style: AppTextStyles.of(context).font14Regular,
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
