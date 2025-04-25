import 'package:book_app/Core/utils/app_sizes.dart';
import 'package:book_app/Features/books/presentation/widgets/book_item.dart';
import 'package:book_app/Features/books/presentation/widgets/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppSizes.defaultHorizontalPadding),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: BookItem(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
