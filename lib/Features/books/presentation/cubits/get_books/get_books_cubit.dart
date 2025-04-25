import 'package:bloc/bloc.dart';
import 'package:book_app/Features/books/domain/entities/book.dart';
import 'package:book_app/Features/books/domain/usecases/get_books_usecase.dart';
import 'package:equatable/equatable.dart';

part 'get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  GetBooksCubit(this.getBooksUsecase) : super(GetBooksLoading());

  final GetBooksUsecase getBooksUsecase;

  Future<void> getBooks() async {
    final result = await getBooksUsecase();
    result.fold(
      (failure) => emit(GetBooksFailure(failure.message)),
      (books) => emit(GetBooksSuccess(books)),
    );
  }
}
