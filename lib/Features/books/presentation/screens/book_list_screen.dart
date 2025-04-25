import 'package:book_app/Core/services/service_locator.dart';
import 'package:book_app/Core/utils/app_sizes.dart';
import 'package:book_app/Core/utils/app_strings.dart';
import 'package:book_app/Core/widgets/custom_empty.dart';
import 'package:book_app/Features/books/presentation/cubits/get_books/get_books_cubit.dart';
import 'package:book_app/Features/books/presentation/widgets/books_list_view.dart';
import 'package:book_app/Features/books/presentation/widgets/custom_app_bar_title.dart';
import 'package:book_app/Core/widgets/custom_error.dart';
import 'package:book_app/Features/books/presentation/widgets/custom_books_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetBooksCubit(sl())..getBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomAppBarTitle(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.defaultHorizontalPadding),
          child: Column(
            children: [
              BlocBuilder<GetBooksCubit, GetBooksState>(
                builder: (context, state) {
                  switch (state) {
                    case GetBooksLoading():
                      return CustomBooksLoading();
                    case GetBooksFailure():
                      return CustomError(message: state.errorMessage);
                    case GetBooksSuccess():
                      return state.books.isEmpty
                          ? CustomEmpty(message: AppStrings.noBooksFound)
                          : BooksListView(books: state.books);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
