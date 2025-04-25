import 'package:bloc/bloc.dart';
import 'package:book_app/Features/books/domain/entities/book.dart';
import 'package:book_app/Features/books/domain/entities/get_books_response.dart';
import 'package:book_app/Features/books/domain/usecases/get_books_usecase.dart';
import 'package:equatable/equatable.dart';

part 'get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  GetBooksCubit(this.getBooksUsecase) : super(GetBooksLoading());

  final GetBooksUsecase getBooksUsecase;

  int currentPage = 1;
  bool hasMore = true;
  List<Book> books = [];
  bool _isLoading = false;

  Future<void> getBooks() async {
    if (_isLoading || !hasMore) {
      return;
    } // Prevent multiple calls if already loading or no more pages
    _isLoading = true;
    final result = await getBooksUsecase(currentPage);
    result.fold(
      (failure) => emit(GetBooksFailure(failure.message)),
      (res) {
        // Check if there are more pages to load
        hasMore = res.next != null;
        currentPage++; // Increment current page
        books.addAll(res.books); // append new books to old

        emit(GetBooksSuccess(res.copyWith(books: books)));
      },
    );
    _isLoading = false;
  }
}
