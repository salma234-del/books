import 'package:book_app/Features/books/domain/entities/book.dart';
import 'package:book_app/Features/books/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    required this.books,
    super.key,
  });
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: books.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: BookItem(book: books[index],),
        ),
      ),
    );
  }
}
