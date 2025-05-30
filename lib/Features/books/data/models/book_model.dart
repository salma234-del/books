import 'package:book_app/Features/books/data/models/author_model.dart';
import 'package:book_app/Features/books/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.title,
    required super.authors,
    required super.summaries,
    required super.imageUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      authors: List.from(json['authors'])
          .map((e) => AuthorModel.fromJson(e))
          .toList(),
      summaries: List.from(json['summaries']).map((e) => e.toString()).toList(),
      imageUrl: json['formats']['image/jpeg'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'authors': authors.map((e) => (e as AuthorModel).toJson()).toList(),
      'summaries': summaries,
      'formats': {
        'image/jpeg': imageUrl,
      },
    };
  }

  // Convert from domain Book to BookModel
  factory BookModel.fromBook(Book book) {
    return BookModel(
      id: book.id,
      title: book.title,
      authors: book.authors,
      summaries: book.summaries,
      imageUrl: book.imageUrl,
    );
  }

}
