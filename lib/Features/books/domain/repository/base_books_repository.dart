import 'package:book_app/Core/error/failures/failure.dart';
import 'package:book_app/Features/books/domain/entities/book.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBooksRepository {
  Future<Either<Failure, List<Book>>> getBooks();
}
