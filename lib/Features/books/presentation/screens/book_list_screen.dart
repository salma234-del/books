import 'package:book_app/Core/services/service_locator.dart';
import 'package:book_app/Core/utils/app_constants.dart';
import 'package:book_app/Core/utils/app_strings.dart';
import 'package:book_app/Core/widgets/custom_empty.dart';
import 'package:book_app/Core/widgets/paginated_list_view.dart';
import 'package:book_app/Features/books/presentation/cubits/get_books/get_books_cubit.dart';
import 'package:book_app/Features/books/presentation/widgets/book_item.dart';
import 'package:book_app/Features/books/presentation/widgets/custom_app_bar_title.dart';
import 'package:book_app/Core/widgets/custom_error.dart';
import 'package:book_app/Features/books/presentation/widgets/custom_books_loading.dart';
import 'package:book_app/Features/books/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              horizontal: 16.r),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              // search bar
              SearchField(),
              SizedBox(height: 24.h),
              // books builder
              BlocBuilder<GetBooksCubit, GetBooksState>(
                builder: (context, state) {
                  var cubit = context.read<GetBooksCubit>();
                  switch (state) {
                    case GetBooksLoading():
                      return CustomBooksLoading();
                    case GetBooksFailure():
                      return CustomError(
                        message: state.errorMessage,
                        onRetry: () => cubit.getBooks(),
                      );
                    case GetBooksSuccess():
                      return state.res.books.isEmpty
                          ? CustomEmpty(message: AppStrings.noBooksFound)
                          : Expanded(
                              child: PaginatedListView(
                                itemCount: state.res.books.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(bottom: 16.r),
                                  child: BookItem(
                                    book: state.res.books[index],
                                  ),
                                ),
                                onLoadMore: () => cubit.getBooks(),
                                hasReachedMax: !cubit.hasMore,
                                valueKey: AppConstants.kBooksListValueKey,
                              ),
                            );
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
