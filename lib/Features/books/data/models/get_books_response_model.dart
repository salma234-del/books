import 'package:book_app/Features/books/data/models/book_model.dart';
import 'package:book_app/Features/books/domain/entities/get_books_response.dart';

class GetBooksResponseModel extends GetBooksResponse {
  const GetBooksResponseModel({
    required super.count,
    required super.books,
    super.next,
    super.previous,
  });

  factory GetBooksResponseModel.fromJson(Map<String, dynamic> json) {
    return GetBooksResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      books: List<BookModel>.from(
        (json['results'] as List).map((e) => BookModel.fromJson(e)),
      ),
    );
  }
}
