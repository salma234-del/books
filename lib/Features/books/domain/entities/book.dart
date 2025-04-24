import 'package:book_app/Features/books/domain/entities/author.dart';
import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int id;
  final String title;
  final List<Author> authors;
  final List<String> summaries;
  final String imageUrl;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        authors,
        summaries,
        imageUrl,
      ];
}
