part of 'get_books_cubit.dart';

sealed class GetBooksState extends Equatable {
  const GetBooksState();

  @override
  List<Object> get props => [];
}

final class GetBooksLoading extends GetBooksState {}

final class GetBooksSuccess extends GetBooksState {
  final List<Book> books;

  const GetBooksSuccess(this.books);

  @override
  List<Object> get props => [books];
}

final class GetBooksFailure extends GetBooksState {
  final String errorMessage;

  const GetBooksFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
