import 'package:book_app/Features/books/domain/entities/book.dart';
import 'package:equatable/equatable.dart';

class GetBooksResponse extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<Book> books;

  const GetBooksResponse({
    required this.count,
    this.next,
    this.previous,
    required this.books,
  });

  GetBooksResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<Book>? books,
  }) {
    return GetBooksResponse(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      books: books ?? this.books,
    );
  }

  @override
  List<Object?> get props => [count, next, previous, books];

  // copy with
}
