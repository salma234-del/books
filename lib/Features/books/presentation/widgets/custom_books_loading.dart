import 'package:book_app/Features/books/domain/entities/author.dart';
import 'package:book_app/Features/books/domain/entities/book.dart';
import 'package:book_app/Features/books/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomBooksLoading extends StatelessWidget {
  const CustomBooksLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        child: ListView.builder(
          itemCount: 3,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: BookItem(
                book: dummyBook,
              ),
            );
          },
        ),
      ),
    );
  }

  static const dummyBook = Book(
    id: 1,
    title: 'Harry Potter and the Deathly Hallows',
    authors: [
      Author(name: 'J. K. Rowling'),
    ],
    summaries: [
      'Harry Potter and the Deathly Hallows is a fantasy novel written by British author J. K. Rowling. It is the seventh and final novel in the Harry Potter series. It was released on 21 July 2007 in the United Kingdom by Bloomsbury Publishing, in the United States by Scholastic, and in Canada by Raincoast Books. The novel chronicles the events directly following Harry Potter and the Half-Blood Prince (2005) and the final confrontation between the wizards Harry Potter and Lord Voldemort. Deathly Hallows shattered sales records upon release, surpassing marks set by previous titles of the Harry Potter series. It holds the Guinness World Record for most novels sold within 24 hours of release, with 8.3 million sold in the US and 2.65 million in the UK.[1][2] Reception to the book was generally positive, and the American Library Association named it a "Best Book for Young Adults". '
    ],
    imageUrl: 'https://www.gutenberg.org/cache/epub/84/pg84.cover.medium.jpg',
  );
}
