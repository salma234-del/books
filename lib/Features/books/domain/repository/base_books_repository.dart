import 'package:book_app/Core/error/failures/failure.dart';
import 'package:book_app/Features/books/domain/entities/get_books_response.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBooksRepository {
  Future<Either<Failure, GetBooksResponse>> getBooks(int page);
}
